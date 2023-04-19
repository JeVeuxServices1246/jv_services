import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jv_services/utils/extensions/goto.dart';
import '../constant/genric_response.dart';
import '../constant/urls.dart';
import '../screens/home_screen.dart';
import '../utils/hive_utils.dart';
import '../utils/session_key.dart';
import 'base_vm.dart';

class LoginVM extends BaseViewModel{
  final loginKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var mobileController = TextEditingController();
  bool _passenable = true;
  bool get passenable => _passenable;
  String dialCode = "1";
  String countryName = "Canada";
  String fcm_token="";
  final _firebaseMessaging = FirebaseMessaging.instance;

  set passenable(bool value) {
    _passenable = value;
    notifyListeners();
  }


  void doLogin() {
    FocusScope.of(context).unfocus();
    _firebaseMessaging.getToken().then((value) {
      if(loginKey.currentState!.validate()){
        call(path:URLs.login, onSuccess: (statusCode, data) {
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
          "phone_number": mobileController.text.toString(),
          "password": passController.text.toString(),
          "fcm_token":value ?? "",
          "country_code":dialCode.toString(),
        },isShowLoader:true);
      }
    });
  }

}