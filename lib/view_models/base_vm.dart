import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../utils/hive_utils.dart';
import 'dart:developer';

import '../utils/session_key.dart';
import '../widget/progress.dart';

abstract class BaseViewModel extends ChangeNotifier {
  late BuildContext context;

  setContext(BuildContext mContext) {
    context = mContext;
  }

  initView() {}
  initAnimation(TickerProvider provider){}
  disposeView() {}

  static ProgressDialog progressDialog = ProgressDialog();

  call({String host = "api.jvservices.ca",
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? params,
    Map<String, String>? headers,
    Method method = Method.get,
    bool isShowLoader = true,
    required Function(int statusCode, String data) onSuccess}) {
    if (isShowLoader) {
      progressDialog.showProgressDialog(context);
    }
    var url = Uri.https(host, "loginapi/$path", queryParameters);
    log(url.toString());
    ////////
    var request = http.Request(method.value, url);
    print("PARAM::${params.toString()}");
    request.bodyFields = params ?? {};
    request.body = jsonEncode(params);
    if (headers != null) {
      headers.putIfAbsent("content-type", () => "application/x-www-form-urlencoded");
      request.headers.addAll(headers);
    } else {
      Map<String, String> defaultHeader = {
        'content-type': "application/x-www-form-urlencoded"
      };
      request.headers.addAll(defaultHeader);
    }
    // if(HiveUtils.getSession<String>(SessionKey.token,defaultValue:"").isNotEmpty){
    //   request.headers.putIfAbsent("Authorization", () => HiveUtils.getSession<String>(SessionKey.token,defaultValue:""));
    // }
    request.send().then((response) {
      if (isShowLoader) {
        progressDialog.dismissProgressDialog(context);
      }
      response.stream.bytesToString().then((data) {
        log("RES:::$data");
        log("RES_CODE:::${response.statusCode}");
        if (response.statusCode == 200) {
          onSuccess(response.statusCode, data);
        } else if(response.statusCode == 422){
          Map object = jsonDecode(data);
          if (object['errors'] != null) {
            object['errors'].forEach((v) {
              Fluttertoast.showToast(
                msg: v,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
              );
            });
          }else if (object['message'] != null) {
            Fluttertoast.showToast(
              msg: object['message'],
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
            );
          }
        }else {
          Fluttertoast.showToast(
            msg: jsonDecode(data)['message'],
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
          );
        }
      });
    });
  }
}
enum Method { post, get, delete, patch }

extension MethodValue on Method {
  String get value {
    switch (this) {
      case Method.post:
        return 'POST';
      case Method.get:
        return 'GET';
      case Method.delete:
        return 'DELETE';
      case Method.patch:
        return 'PATCH';
      default:
        return "";
    }
  }
}