import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jv_services/utils/extensions/goto.dart';
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
    final token = _firebaseMessaging.getToken().then((value) {print('Token: $value'); fcm_token = '$value';});
    notifyListeners();
    FocusScope.of(context).unfocus();
    if(loginKey.currentState!.validate()){
      call(path:"login/", onSuccess: (statusCode, data) {
        print(statusCode);
        Map object = jsonDecode(data);
        Fluttertoast.showToast(msg:object["message"]);
        print("----------response-------"+object['data']);
        HiveUtils.addSession(SessionKey.token, object['token']);
        HiveUtils.addSession(SessionKey.user,jsonEncode(object['user_data']));
        HiveUtils.addSession(SessionKey.firstName,object['user_data']['first_name']);
        HiveUtils.addSession(SessionKey.lastname, object['user_data']['last_name']);
        HiveUtils.addSession(SessionKey.phonenum, object['user_data']['phone_number']);
        HiveUtils.addSession(SessionKey.countrycode, object['user_data']['country_code']);
        HiveUtils.addSession(SessionKey.email, object['user_data']['email']);
        HiveUtils.addSession(SessionKey.username, object['user_data']['username']);
        HiveUtils.addSession(SessionKey.isLoggedIn, true);
        notifyListeners();
        context.pushReplacement(const HomeScreen());
      },method: Method.post,params: {
        "phone_number": mobileController.text.toString(),
        "password": passController.text.toString(),
        "fcm_token":fcm_token.toString(),
        "country_code":dialCode.toString(),
      },isShowLoader:true);
    }
  }

}