import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jv_services/screens/new_password.dart';
import 'package:jv_services/screens/signup.dart';
import 'package:jv_services/utils/extensions/goto.dart';
import 'package:jv_services/utils/theme_extension.dart';
import 'package:jv_services/widget/base_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../constant/app_assets_path.dart';
import '../constant/strings.dart';
import '../view_models/verification_vm.dart';

class VerificationScreen extends BaseWidget<VerificationVM> {
  const VerificationScreen({super.key});

  @override
  Widget buildUI(BuildContext context, VerificationVM viewModel) {
    var deviceWidth = context.mediaSize.width;
    var deviceHeight = context.mediaSize.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(
            child: Text(AppStrings.appVerificationOtp,
                textAlign: TextAlign.center,
                style: GoogleFonts.josefinSans(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 23,
                    color: Colors.black,
                  ),
                ))),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
                padding: const EdgeInsets.only(left: 0.1, top: 100, right: 0.1),
                height: deviceHeight,
                width: deviceWidth,
                child: Container(
                    child: Image.asset(
                  AppAssets.verification,
                  height: deviceHeight,
                  fit: BoxFit.fill,
                  width: deviceWidth,
                ))),
            SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.only(left: 40, right: 25, top: 155),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(AppStrings.conformVerificationOtp,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17,
                                  color: Colors.white),
                            )),
                      ),
                      const SizedBox(
                        height: 55,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                            "${AppStrings.titleVerificationOtp}${" "}${"+"}${viewModel.mobileNumberScreenVM.dialCode}${"- "}${viewModel.mobileNumberScreenVM.mobileController.text}",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17,
                                  color: Colors.white),
                            )),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      PinCodeTextField(
                        appContext: context,
                        length: 4,
                        obscureText: false,
                        autovalidateMode: AutovalidateMode.always,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.circle,
                          fieldHeight: 80,
                          fieldWidth: 50,
                          activeColor: Colors.grey,
                          inactiveColor: Colors.grey,
                          inactiveFillColor: Colors.grey,
                          selectedColor: Colors.grey,
                          selectedFillColor: Colors.white,
                          disabledColor: Colors.grey,
                          activeFillColor: Colors.grey,
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        // errorAnimationController: errorController,
                        //controller: textEditingController,
                        //runs when every textfield is filled
                        onCompleted: (v) {
                          viewModel.mobileNumberScreenVM.otp = v;
                        },
                        onChanged: (value) {
                          viewModel.mobileNumberScreenVM.otp = value;
                        },
                        beforeTextPaste: (text) {
                          print("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              viewModel.resendSendOTP();
                              viewModel.start = 60;
                              viewModel.startTimer();
                            },
                            child: Visibility(
                              visible: viewModel.start == 0 ? true : false,
                              child: Text(
                                  AppStrings.resendVerificationOtp
                                      .toUpperCase(),
                                  style: GoogleFonts.poppins(
                                      decoration: TextDecoration.underline,
                                      fontSize: 12,
                                      color: Colors.white),
                                  textAlign: TextAlign.center),
                            ),
                          ),
                          Visibility(
                            visible: viewModel.start == 0 ? false : true,
                            child: Text("00: ${viewModel.start}",
                                style: GoogleFonts.poppins(
                                    fontSize: 12, color: Colors.white),
                                textAlign: TextAlign.center),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        height: 55,
                        color: Colors.grey,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        onPressed: () {
                          if (viewModel.mobileNumberScreenVM.otp.isNotEmpty) {
                            if (viewModel.mobileNumberScreenVM.otp.toString() ==
                                viewModel.mobileNumberScreenVM.currentOtp
                                    .toString()) {
                              if (viewModel.mobileNumberScreenVM
                                      .statusForgotPassword ==
                                  "forget password") {
                                context.pushReplacement(const NewPassword());
                              } else {
                                context.pushReplacement(const SignUpScreen());
                              }
                            } else {
                              var snackBar = const SnackBar(
                                content: Text('Enter a valid OTP'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          } else {
                            var snackBar = const SnackBar(
                              content: Text('Enter OTP'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          child: Text(
                              AppStrings.verifyVerificationOtp.toUpperCase(),
                              style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  letterSpacing: 1,
                                  color: Colors.white,
                                ),
                              )),
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
