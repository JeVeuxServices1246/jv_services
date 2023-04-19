import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jv_services/utils/extensions/goto.dart';
import 'package:jv_services/view_models/base_vm.dart';
import 'package:provider/provider.dart';

import '../constant/genric_response.dart';
import '../constant/urls.dart';
import '../screens/home_screen.dart';
import '../utils/hive_utils.dart';
import '../utils/session_key.dart';
import 'mobile_number_vm.dart';

class NewPasswordVM extends BaseViewModel{
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  bool _passenable = true;
  bool _confimPass = true;
  final newKey = GlobalKey<FormState>();
  late MobileNumberScreenVM mobileNumberScreenVM;

  @override
  initView() {
    mobileNumberScreenVM = context.read<MobileNumberScreenVM>();
    return super.initView();
  }
  bool get passenable => _passenable;

  set passenable(bool value) {
    _passenable = value;
    notifyListeners();
  }

  bool get confimPass => _confimPass;

  set confimPass(bool value) {
    _confimPass = value;
    notifyListeners();
  }

  void forgotUser() {
    FocusScope.of(context).unfocus();
    FirebaseMessaging.instance.getToken().then((value) {
      if(newKey.currentState!.validate()){
        call(path:URLs.forgetPassword, onSuccess: (statusCode, data) {
          Map object = jsonDecode(data);
          final apiResponse = ApiResponse.fromJson(object);
          Fluttertoast.showToast(msg: apiResponse.message);
          if (apiResponse.status == true) {
            HiveUtils.addSession(SessionKey.token, object['data']['token']);
            HiveUtils.addSession(SessionKey.user,jsonEncode(object['data']['user_data']));
            HiveUtils.addSession(SessionKey.isLoggedIn, true);
            context.pushAndRemoveUntil(const HomeScreen());
          }

        },method: Method.post,params: {
          "phone_number":mobileNumberScreenVM.mobileController.text.toString(),
          "password":confirmPassController.text.toString(),
          "fcm_token":value ?? "",
        },isShowLoader:true);
      }
    });
  }
}