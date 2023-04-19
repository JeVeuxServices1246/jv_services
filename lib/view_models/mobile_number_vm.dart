import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jv_services/screens/verification_screen.dart';
import 'package:jv_services/utils/extensions/goto.dart';
import 'package:jv_services/view_models/base_vm.dart';

import '../constant/genric_response.dart';
import '../constant/urls.dart';

class MobileNumberScreenVM extends BaseViewModel{
  String dialCode = "1";
  String countryName = "Canada";
  int currentOtp = 0;
  String otp = "";
  String statusForgotPassword = "";
  final signupKey = GlobalKey<FormState>();
  TextEditingController mobileController = TextEditingController();

  void sendOTP(bool status) {
    FocusScope.of(context).unfocus();
    if(signupKey.currentState!.validate()){
      call(path:URLs.sentOtp, onSuccess: (statusCode, data) {
        Map object = jsonDecode(data);
        final apiResponse = ApiResponse.fromJson(object);
        Fluttertoast.showToast(msg: apiResponse.message);
        if (apiResponse.status == true) {
          currentOtp = apiResponse.data['otp'];
          context.pushReplacement(const VerificationScreen());
        }
      },method: Method.post,params: {
        "phone_number": mobileController.text.toString(),
        "country_code":dialCode.toString(),
        "forgot_password":statusForgotPassword
      },isShowLoader:true);
    }
  }
}