
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jv_services/utils/extensions/goto.dart';
import 'package:jv_services/utils/theme_extension.dart';

import '../constant/app_assets_path.dart';
import '../constant/color.dart';
import '../constant/strings.dart';
import '../phone/intl_phone_field.dart';
import '../view_models/mobile_number_vm.dart';
import '../widget/base_widget.dart';

class MobileNumberScreen extends BaseWidget<MobileNumberScreenVM>{
  String status;
  MobileNumberScreen({super.key,required this.status});

  @override
  Widget buildUI(BuildContext context, MobileNumberScreenVM viewModel) {
    var deviceWidth = context.mediaSize.width;
    var deviceHeight = context.mediaSize.height;
    viewModel.statusForgotPassword = status;
    return Scaffold(
      body: Stack(
        fit:StackFit.loose,
        children: [
          Container(
            height: deviceHeight / 1.5,
            width: deviceWidth,
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            child: Container(
              padding: const EdgeInsets.only(bottom: 200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppStrings.loginTitle,
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 19,
                          color: Colors.white,
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(AppStrings.loginSubtitle,
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 25),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  height: deviceHeight-250,
                  width: deviceWidth,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40))),
                  child: Container(
                    padding: const EdgeInsets.only(top: 40,left:20, right:20,),
                    child: SingleChildScrollView(
                      child: Form(
                        key:viewModel.signupKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Verification",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        color: Colors.black,
                                      ),
                                    )),
                                const SizedBox(
                                  height: 37,
                                ),
                                IntlPhoneField(
                                  decoration: const InputDecoration(
                                      hintText: 'Phone Number',
                                      hintStyle:TextStyle(fontSize:14)
                                  ),
                                  controller:viewModel.mobileController,
                                  textInputAction: TextInputAction.done,
                                  initialCountryCode: 'CA',
                                  onCountryChanged: (country) {
                                    viewModel.dialCode = country.dialCode;
                                    viewModel.countryName = country.name;
                                  },
                                  onChanged: (phone) {
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),

                              ],
                            ),
                            const SizedBox(height:20),
                            InkWell(
                              onTap: () => context.pop(),
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('have an account?',
                                      textScaleFactor: 1,
                                      style: GoogleFonts.poppins(
                                          fontSize:12,
                                          color: AppColors.textBlackColor,
                                          fontWeight: FontWeight.w400)),
                                  Text(
                                    'Login',
                                    style: GoogleFonts.roboto(
                                        textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color:AppColors.blackColor,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10, right: 25),
                              child: Text(
                                  'We will send you a verification \n code to your phone number',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                    textStyle: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color(0xffB4B4B4),
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            GestureDetector(
                              onTap: () {
                                if(viewModel.signupKey.currentState!.validate()){
                                  if(status =="forget password") {
                                    // HiveUtils.addSession(SessionKey.forgetPassNum,viewModel.mobileController.text.toString() );
                                    viewModel.sendOTP(true);
                                  }else{
                                    viewModel.sendOTP(false);
                                  }


                                }
                              },
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Image.asset(
                                  AppAssets.nextOnBoarding,
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}