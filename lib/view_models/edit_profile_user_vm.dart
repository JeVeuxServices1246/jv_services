import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jv_services/utils/extensions/on_stream.dart';
import 'package:jv_services/view_models/base_vm.dart';

import '../constant/genric_response.dart';
import '../constant/urls.dart';
import '../utils/hive_utils.dart';
import '../utils/session_key.dart';

class EditProfileUserVM extends BaseViewModel{
  TextEditingController numberController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  int _numberCount = 0;
  final upKey = GlobalKey<FormState>();

  @override
  initView() {
    firstNameController.text = HiveUtils.getSession<String>(SessionKey.user,defaultValue: "{}").userModel().firstName ?? "";
    lastNameController.text = HiveUtils.getSession<String>(SessionKey.user,defaultValue: "{}").userModel().lastName ?? "";
    emailController.text = HiveUtils.getSession<String>(SessionKey.user,defaultValue: "{}").userModel().email ?? "";
    numberController.text = HiveUtils.getSession<String>(SessionKey.user,defaultValue: "{}").userModel().phoneNumber ?? "";
    return super.initView();
  }
  int get numberCount => _numberCount;

  set numberCount(int value) {
    _numberCount = value;
    notifyListeners();
  }

  void updateProfile() {
    FocusScope.of(context).unfocus();
    FirebaseMessaging.instance.getToken().then((value) {
      if(upKey.currentState!.validate()){
        call(path:URLs.update_profile, onSuccess: (statusCode, data) {
          Map object = jsonDecode(data);
          final apiResponse = ApiResponse.fromJson(object);
          Fluttertoast.showToast(msg: apiResponse.message);
        },method: Method.post,params: {
          "first_name":firstNameController.text.toString(),
          "last_name":lastNameController.text.toString(),
          "email":emailController.text.toString(),
          "fcm_id":value ?? "",
        },isShowLoader:true);
      }
    });
  }
}