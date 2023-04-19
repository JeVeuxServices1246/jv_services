import 'dart:async';
import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:jv_services/view_models/base_vm.dart';
import 'package:jv_services/view_models/mobile_number_vm.dart';
import 'package:provider/provider.dart';

import '../constant/genric_response.dart';
import '../constant/urls.dart';

class VerificationVM extends BaseViewModel{
  int _start = 60;
  late Timer _timer;
  late MobileNumberScreenVM mobileNumberScreenVM;

  @override
  initView() {
    _start = 60;
    mobileNumberScreenVM = context.read<MobileNumberScreenVM>();
    startTimer();
    return super.initView();
  }


  int get start => _start;

  set start(int value) {
    _start = value;
    notifyListeners();
  }

  void startTimer() {
    const oneSec = Duration(milliseconds:500);
    _timer = Timer.periodic(
        oneSec,
            (Timer timer) {
              if (start ==0) {
                timer.cancel();
              } else {
                start = start -1;
              }
            });
  }
  void resendSendOTP() {
    call(path:URLs.sentOtp, onSuccess: (statusCode, data) {
      Map object = jsonDecode(data);
      final apiResponse = ApiResponse.fromJson(object);
      Fluttertoast.showToast(msg: apiResponse.message);
      if (apiResponse.status == true) {
        mobileNumberScreenVM.currentOtp = apiResponse.data['otp'];
      }
    },method: Method.post,params: {
      "phone_number": mobileNumberScreenVM.mobileController.text.toString(),
      "country_code":mobileNumberScreenVM.dialCode.toString(),
      "forgot_password":mobileNumberScreenVM.statusForgotPassword
    },isShowLoader:true);
  }
}