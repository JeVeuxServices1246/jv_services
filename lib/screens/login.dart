
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jv_services/phone/intl_phone_field.dart';
import 'package:jv_services/screens/signup.dart';
import 'package:jv_services/utils/extensions/goto.dart';
import '../constant/app_assets_path.dart';
import '../constant/color.dart';
import '../constant/strings.dart';
import '../view_models/login_vm.dart';
import '../widget/base_widget.dart';
import 'mobile_number_screen.dart';

class Login extends BaseWidget<LoginVM>{
  const Login({super.key});

  @override
  Widget buildUI(BuildContext context, LoginVM viewModel) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: deviceHeight / 1.7,
              width: deviceWidth,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              child: Container(
                padding: const EdgeInsets.only(bottom: 150),
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
                    width: deviceWidth,
                    height: deviceHeight / 1.5,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40))),
                    child: Container(
                      padding: const EdgeInsets.only(top:40, left: 20, right: 5),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(left:15,right:15),
                          child: Form(
                            key:viewModel.loginKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(AppStrings.loginInfo,
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        color: Colors.black,
                                      ),
                                    )),
                                const SizedBox(
                                  height:30,
                                ),
                                IntlPhoneField(
                                  textAlign:TextAlign.start,
                                  keyboardType: const TextInputType.numberWithOptions(signed: true),
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
                                TextFormField(
                                  controller: viewModel.passController,
                                  obscureText: viewModel.passenable,
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.done,
                                  validator: (val){
                                    if(val!.isEmpty) {
                                      return strEmptyPassword;
                                    }else if(val.length < 6) {
                                      return strInvalidPassword;
                                    }
                                    return null;
                                  },
                                  decoration:InputDecoration(
                                      hintText: 'Password',
                                      suffixIcon: IconButton(onPressed: (){ //add Icon button at end of TextField
                                        if(viewModel.passenable){ //if viewModel.passenable == true, make it false
                                          viewModel.passenable= false;
                                        }else{
                                          viewModel.passenable = true; //if viewModel.passenable == false, make it true
                                        }
                                      }, icon: Icon(viewModel.passenable == true?Icons.visibility_off_outlined:Icons.remove_red_eye_outlined,color:AppColors.blackColor,))
                                  ),
                                ),
                                const SizedBox(
                                  height:10,
                                ),
                                InkWell(
                                  onTap:(){
                                    context.push(MobileNumberScreen(status: 'forget password',));
                                  },
                                  child: Align(
                                    alignment:Alignment.centerRight,
                                    child: Text(
                                      'Forget Password',
                                      style: GoogleFonts.roboto(
                                          textStyle: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: AppColors.blackColor,
                                          )),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 55,
                                ),
                                InkWell(
                                  onTap: () => context.push(MobileNumberScreen(status: 'registration',)),
                                  child:  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Don\'t have an account?',
                                          textScaleFactor: 1,
                                          style: GoogleFonts.poppins(
                                              fontSize:12,
                                              color: AppColors.textBlackColor,
                                              fontWeight: FontWeight.w400)),
                                      InkWell(
                                        onTap: () => context.push(MobileNumberScreen(status: 'registration',)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child:  Text(
                                            'Registration',
                                            style: GoogleFonts.roboto(
                                                textStyle: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: AppColors.blackColor,
                                                )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height:30,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if(viewModel.loginKey.currentState!.validate()){
                                      viewModel.doLogin();
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
              ),
            )
          ],
        ),
      ),
    );
  }

}
