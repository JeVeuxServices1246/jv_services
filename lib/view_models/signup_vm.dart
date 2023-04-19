import 'dart:convert';

import 'package:country_calling_code_picker/picker.dart';
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


class SignUpVM extends BaseViewModel{
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  final upKey = GlobalKey<FormState>();
  bool _passenable = true;
  bool _confimPass = true;
  late MobileNumberScreenVM mobileNumberScreenVM;
  @override
  initView() {
    mobileNumberScreenVM = context.read<MobileNumberScreenVM>();
    _passenable = true;
    _confimPass = true;
    return super.initView();
  }


  bool get passenable => _passenable;

  set passenable(bool value) {
    _passenable = value;
    notifyListeners();
  }

  void registerUser() {
    FocusScope.of(context).unfocus();
    FirebaseMessaging.instance.getToken().then((value) {
      if(upKey.currentState!.validate()){
        call(path:URLs.registration, onSuccess: (statusCode, data) {
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
          "first_name":firstNameController.text.toString(),
          "last_name":lastNameController.text.toString(),
          "email":emailController.text.toString(),
          "country_code":mobileNumberScreenVM.dialCode.toString(),
          "fcm_token":value ?? "",
        },isShowLoader:true);
      }
    });

  }

  bool get confimPass => _confimPass;

  set confimPass(bool value) {
    _confimPass = value;
    notifyListeners();
  }
}