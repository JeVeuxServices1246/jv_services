import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jv_services/core/constants/app_assets.dart';
import 'package:jv_services/core/constants/strings.dart';
import 'package:jv_services/features/data/data_source/router/cubit/routing_cubit.dart';
import 'package:jv_services/features/data/models/common/loading_state.dart';
import 'package:jv_services/features/data/models/register/register_resp.dart';
import 'package:jv_services/features/data/models/register/user_register_model.dart';
import 'package:jv_services/features/presentation/register/otp_route/bloc/register_otp_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class RegisterNewOtpScreen extends StatefulWidget {
  final RegisterSuccessResponse registerSuccessResponse;
  final UserRegister userRegister;
  const RegisterNewOtpScreen(
      {super.key,
      required this.registerSuccessResponse,
      required this.userRegister});

  @override
  State<RegisterNewOtpScreen> createState() => _RegisterNewOtpScreenState();
}

class _RegisterNewOtpScreenState extends State<RegisterNewOtpScreen> {
  @override
  void initState() {
    context.read<RegisterOtpBloc>().add(OTPRegisterSuccessResponseEvent(
        registerSuccessResponse: widget.registerSuccessResponse));
    context
        .read<RegisterOtpBloc>()
        .add(OTPUserRegisterEvent(userRegister: widget.userRegister));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;
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
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ))),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
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
                child: Image.asset(
                  AppAssets.verification,
                  height: deviceHeight,
                  fit: BoxFit.fill,
                  width: deviceWidth,
                )),
            SingleChildScrollView(
              child: BlocListener<RegisterOtpBloc, RegisterOtpState>(
                listener: (_, state) {
                  if (state.loading == LoadingState.show) {
                    showDialog(
                        context: context,
                        // routeSettings: const RouteSettings(name: LoadingPopup.router),
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return const Dialog(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            child: SpinKitDoubleBounce(
                              color: Colors.white,
                              size: 50.0,
                            ),
                          );
                        });
                    return;
                  } else if (state.loading == LoadingState.hide) {
                    Navigator.pop(context);
                    return;
                  }
                  if (state.registerSuccessResponse != null) {
                    // return;
                    // context.push(AppRouteConstants.registerOTPRouteInfo.fullPath);
                  }
                  if (state.registerException != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text(state.registerException!.exception.toString(),
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                )),
                        backgroundColor: Colors.black,
                      ),
                    );
                  }
                },
                child: Container(
                    padding:
                        const EdgeInsets.only(left: 40, right: 25, top: 155),
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
                              "${AppStrings.titleVerificationOtp}${" "}${widget.userRegister.countryCode}${"- "}${widget.userRegister.phone}",
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

                          length: widget.registerSuccessResponse.otp
                              .toString()
                              .length,
                          obscureText: false,
                          autovalidateMode: AutovalidateMode.always,
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.circle,
                            fieldHeight: 50,
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
                            // viewModel.mobileNumberScreenVM.otp = v;
                          },
                          onChanged: (value) {
                            BlocProvider.of<RegisterOtpBloc>(context)
                                .add(OTPNewOtpEvent(otp: value));
                            // viewModel.mobileNumberScreenVM.otp = value;
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
                        BlocBuilder<RegisterOtpBloc, RegisterOtpState>(
                          builder: (context, state) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    BlocProvider.of<RegisterOtpBloc>(context)
                                        .add(OTPResendOtpEvent(
                                            userRegister: widget.userRegister));
                                    // viewModel.resendSendOTP();
                                    // viewModel.start = 60;
                                    // viewModel.startTimer();
                                  },
                                  child: Visibility(
                                    visible:
                                        state.time == "00:00" ? true : false,
                                    // visible: viewModel.start == 0 ? true : false,
                                    child: Text(
                                        AppStrings.resendVerificationOtp
                                            .toUpperCase(),
                                        style: GoogleFonts.poppins(
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 12,
                                            color: Colors.white),
                                        textAlign: TextAlign.center),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Visibility(
                                  // visible: state.time == "00:00" ? false : true,
                                  child: Text(state.time,
                                      style: GoogleFonts.poppins(
                                          fontSize: 12, color: Colors.white),
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            );
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        MaterialButton(
                          padding: const EdgeInsets.all(16),
                          minWidth: MediaQuery.of(context).size.width,
                          color: Colors.grey,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          onPressed: () {
                            // if (viewModel.mobileNumberScreenVM.otp.isNotEmpty) {
                            //   if (viewModel.mobileNumberScreenVM.otp.toString() ==
                            //       viewModel.mobileNumberScreenVM.currentOtp
                            //           .toString()) {
                            //     if (viewModel.mobileNumberScreenVM
                            //             .statusForgotPassword ==
                            //         "forget password") {
                            //       context.pushReplacement(const NewPassword());
                            //     } else {
                            //       context.pushReplacement(const SignUpScreen());
                            //     }
                            //   } else {
                            //     var snackBar = const SnackBar(
                            //       content: Text('Enter a valid OTP'),
                            //     );
                            //     ScaffoldMessenger.of(context)
                            //         .showSnackBar(snackBar);
                            //   }
                            // } else {
                            //   var snackBar = const SnackBar(
                            //     content: Text('Enter OTP'),
                            //   );
                            //   ScaffoldMessenger.of(context)
                            //       .showSnackBar(snackBar);
                            // }
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
            ),
          ],
        ),
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text("Enter OTP"),
    //   ),
    //   body: SafeArea(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Container(
    //           padding: const EdgeInsets.all(10),
    //           child: Text(widget.userRegister.firstname.toString()),
    //         ),
    //         Container(
    //           padding: const EdgeInsets.all(10),
    //           child: Text(widget.userRegister.lastname.toString()),
    //         ),
    //         Container(
    //           padding: const EdgeInsets.all(10),
    //           child: Text(widget.userRegister.email.toString()),
    //         ),
    //         Container(
    //           padding: const EdgeInsets.all(10),
    //           child: Text(widget.userRegister.phone.toString()),
    //         ),
    //         Container(
    //           padding: const EdgeInsets.all(10),
    //           child: Text(widget.registerSuccessResponse.message.toString()),
    //         ),
    //         GestureDetector(
    //           onTap: () {
    //             context.read<RoutingCubit>().login();
    //           },
    //           child: Container(
    //             padding: const EdgeInsets.all(10),
    //             child: Text(widget.registerSuccessResponse.token.toString()),
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
