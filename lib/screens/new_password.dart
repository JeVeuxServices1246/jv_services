
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jv_services/utils/theme_extension.dart';
import 'package:jv_services/utils/theme_extension.dart';

import '../constant/app_assets_path.dart';
import '../constant/color.dart';
import '../constant/strings.dart';
import '../view_models/new_password_vm.dart';
import '../widget/base_widget.dart';

class NewPassword extends BaseWidget<NewPasswordVM>{
  const NewPassword({super.key});

  @override
  Widget buildUI(BuildContext context, NewPasswordVM viewModel) {
    var deviceWidth = context.mediaSize.width;
    var deviceHeight = context.mediaSize.height;
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
              padding: const EdgeInsets.only(bottom: 250),
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
                        key:viewModel.newKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Reset Password",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        color: Colors.black,
                                      ),
                                    )),
                                const SizedBox(
                                  height: 17,
                                ),
                                TextFormField(
                                  controller: viewModel.passController,
                                  obscureText: viewModel.passenable,
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.done,
                                  validator: (val){
                                    if(val!.isEmpty) {
                                      return strEmptyPassword;
                                    }
                                    else if(val.length < 6) {
                                      return strInvalidPassword;
                                    }
                                    return null;
                                  },
                                  decoration:InputDecoration(
                                      hintText: 'Password',
                                      suffixIcon: IconButton(onPressed: (){ //add Icon button at end of TextField
                                        if(viewModel.passenable){ //if viewModel.passenable == true, make it false
                                          viewModel.passenable = false;
                                        }else{
                                          viewModel.passenable = true; //if viewModel.passenable == false, make it true
                                        }
                                      }, icon: Icon(viewModel.passenable == true?Icons.visibility_off_outlined:Icons.remove_red_eye_outlined,color:AppColors.blackColor,))
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: viewModel.confirmPassController,
                                  obscureText: viewModel.confimPass,
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.done,
                                  validator: (val){
                                    if(val!.isEmpty) {
                                      return strEmptyPassword;
                                    }
                                    else if(val != viewModel.passController.text) {
                                      return 'Not Match';
                                    }
                                    else if(val.length < 6) {
                                      return strInvalidPassword;
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      hintText: 'Confirm Password',
                                      suffixIcon: IconButton(onPressed: (){ //add Icon button at end of TextField
                                        if(viewModel.confimPass){ //if passenable == true, make it false
                                          viewModel.confimPass = false;
                                        }else{
                                          viewModel.confimPass = true; //if passenable == false, make it true
                                        }
                                      }, icon: Icon(viewModel.confimPass == true?Icons.visibility_off_outlined:Icons.remove_red_eye_outlined,color:AppColors.blackColor,))
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),

                              ],
                            ),
                            const SizedBox(height:20),
                            const SizedBox(
                              height: 25,
                            ),
                            GestureDetector(
                              onTap: () {
                                if(viewModel.newKey.currentState!.validate()){
                                  viewModel.forgotUser();

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