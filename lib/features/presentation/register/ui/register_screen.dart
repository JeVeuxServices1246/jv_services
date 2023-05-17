import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jv_services/core/colors.dart';
import 'package:jv_services/core/constants/app_assets.dart';
import 'package:jv_services/core/constants/strings.dart';
import 'package:jv_services/features/data/data_source/router/app_route_constants.dart';
import 'package:jv_services/features/presentation/common/countries/countries_widget.dart';
import 'package:jv_services/features/presentation/register/bloc/register_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegExp phoneNumberRegex = RegExp(
      r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$');
  final RegExp emailRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  final RegExp passwordRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  final RegExp nameRegExp = RegExp(r'^[a-z A-Z]+$');
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.loose,
          children: [
            Container(
              height: deviceHeight / 1.5,
              width: deviceWidth,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
            ),
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          child: Text(AppStrings.loginTitle,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19,
                                  color: Colors.white,
                                ),
                              )),
                        ),
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
                Expanded(
                  flex: 8,
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 25),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        // height: deviceHeight - 150,
                        // width: deviceWidth,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 15),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(AppStrings.signInfo,
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.roboto(
                                            textStyle: const TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 22,
                                              color: Colors.black,
                                            ),
                                          )),
                                      const SizedBox(
                                        height: 17,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(child: _firstNameBloc()),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          Expanded(child: _lastnameBloc())
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      _emailBloc(),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      _phoneBloc(),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      _passwordBloc(),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      _confirmPasswordBloc(),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                InkWell(
                                  onTap: () => context.pop(),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('have an account?',
                                          textScaleFactor: 1,
                                          style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              color: AppColors.textBlackColor,
                                              fontWeight: FontWeight.w400)),
                                      Text(
                                        'Login',
                                        style: GoogleFonts.roboto(
                                            textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: AppColors.blackColor,
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 25),
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
                                    if (_formKey.currentState!.validate()) {
                                      BlocProvider.of<RegisterBloc>(context)
                                          .add(Register());
                                      // context.push(AppRouteConstants
                                      //     .registerOTPRouteInfo.fullPath);
                                    }
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return const CountriesDialogWidget();
                                        });
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
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _firstNameBloc() {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return customTextField(
          textCapitalization: TextCapitalization.words,
          validator: (firstname) {
            if (firstname == null || firstname.isEmpty) {
              return "Enter first name";
            }
            if (firstname.length < 3) {
              return "Enter atleast 3 characters";
            }
            if (!nameRegExp.hasMatch(firstname)) {
              return "Special chars and number are not allowed!";
            }
            return null;
          },
          textHint: 'First Name',
          isPassword: false,
          onChange: (value) {
            BlocProvider.of<RegisterBloc>(context).add(FirstNameChanged(value));
          },
          keyboardType: TextInputType.text,
          // formatter: [
          //   FilteringTextInputFormatter.allow(RegExp(r'^[a-z A-Z]+$')),
          // ],
          errorMsg: null);
    });
  }

  Widget _lastnameBloc() {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return customTextField(
          textCapitalization: TextCapitalization.words,
          validator: (lastName) {
            if (lastName == null || lastName.isEmpty) {
              return "Enter last name";
            }
            if (lastName.length < 3) {
              return "Enter atleast 3 characters";
            }
            if (!nameRegExp.hasMatch(lastName)) {
              return "Special chars and numbers are not allowed!";
            }
            return null;
          },
          textHint: 'Last Name',
          isPassword: false,
          onChange: (value) {
            BlocProvider.of<RegisterBloc>(context).add(LastNameChanged(value));
          },
          keyboardType: TextInputType.text,
          // formatter: [
          //   FilteringTextInputFormatter.allow(RegExp(r'^[a-z A-Z]+$')),
          // ],
          errorMsg: null);
    });
  }

  Widget _phoneBloc() {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return customTextField(
          textHint: "Phone",
          validator: (phone) {
            if (phone == null) {
              return "phone should not be blank";
            }
            if (!phoneNumberRegex.hasMatch(phone)) {
              return "Please Enter a Valid Phone Number";
            }
            return null;
          },
          isPassword: false,
          onChange: (value) {
            BlocProvider.of<RegisterBloc>(context).add(PhoneChanged(value));
          },
          keyboardType: TextInputType.phone,
          errorMsg: null);
    });
  }

  Widget _emailBloc() {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return customTextField(
          textHint: "Email",
          isPassword: false,
          validator: (email) {
            if (email == null || email.isEmpty) {
              return "Email should not be blank";
            }
            if (!emailRegex.hasMatch(email)) {
              return "Enter valid email address";
            }
            return null;
          },
          onChange: (value) {
            BlocProvider.of<RegisterBloc>(context).add(EmailChanged(value));
          },
          keyboardType: TextInputType.emailAddress,
          errorMsg: null);
    });
  }

  Widget _passwordBloc() {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return customTextField(
          textHint: "Password",
          isPassword: true,
          validator: (password) {
            if (password == null || password.length < 8) {
              return "Password minimum contains 8 char";
            }
            return null;
          },
          onChange: (value) {
            BlocProvider.of<RegisterBloc>(context).add(PasswordChanged(value));
          },
          keyboardType: TextInputType.visiblePassword,
          pwdVisible: state.pwdVisible,
          visible: () {
            BlocProvider.of<RegisterBloc>(context)
                .add(PasswordVisibled(!state.pwdVisible));
          },
          errorMsg: null);
    });
  }

  Widget _confirmPasswordBloc() {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return customTextField(
          textHint: "Confirm Password",
          isPassword: true,
          validator: (password) {
            if (password == null || password.length < 8) {
              return "Password minimum contains 8 char";
            }
            if (state.password != password) {
              return "Confirm Password does not match with password";
            }
            return null;
          },
          onChange: (value) {
            BlocProvider.of<RegisterBloc>(context)
                .add(ConfirmPasswordChanged(value));
          },
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.visiblePassword,
          pwdVisible: state.confirmPwdVisible,
          visible: () {
            final isVisible = state.confirmPwdVisible ? false : true;
            BlocProvider.of<RegisterBloc>(context)
                .add(ConfirmPasswordVisibled(!state.confirmPwdVisible));
          },
          errorMsg: null);
    });
  }

  Widget customTextField(
      {required String textHint,
      required bool isPassword,
      required Function(String) onChange,
      TextInputType keyboardType = TextInputType.text,
      List<TextInputFormatter>? formatter,
      Function()? visible,
      bool pwdVisible = false,
      textInputAction: TextInputAction.next,
      String? Function(String?)? validator,
      String? errorMsg,
      TextCapitalization textCapitalization = TextCapitalization.none}) {
    return Column(
      children: [
        TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            autocorrect: false,
            textCapitalization: textCapitalization,
            validator: validator,
            onChanged: onChange,
            obscureText: isPassword ? pwdVisible : false,
            inputFormatters: formatter ?? const [],
            textInputAction: textInputAction,
            decoration: InputDecoration(
                hintText: textHint,
                suffixIcon: isPassword
                    ? IconButton(
                        onPressed: visible,
                        icon: Icon(
                            pwdVisible
                                ? Icons.remove_red_eye_outlined
                                : Icons.visibility_off_outlined,
                            color: AppColors.blackColor))
                    : null)),
        if (errorMsg != null) ...[
          const SizedBox(height: 5),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              errorMsg,
              maxLines: 2,
              style: const TextStyle(color: Colors.red, fontSize: 12.0),
            ),
          ),
        ]
      ],
    );
  }
}


  // child: TextFormField(
                                                //   // controller:
                                                //   //     viewModel.firstNameController,
                                                //   obscureText: false,
                                                //   inputFormatters: [
                                                //     FilteringTextInputFormatter.allow(
                                                //         RegExp('[a-zA-Z]')),
                                                //   ],
                                                //   validator: (value) {
                                                //     // return Validator.validateFormField(
                                                //     //     value!,
                                                //     //     strErrorEmptyFirstName,
                                                //     //     strInvalidFirstName,
                                                //     //     Constants.NORMAL_VALIDATION);
                                                //   },
                                                //   keyboardType: TextInputType.name,
                                                //   textInputAction:
                                                //       TextInputAction.done,
                                                //   decoration: const InputDecoration(
                                                //     hintText: 'First Name',
                                                //   ),
                                                // ),



                                                
                                                // child: TextFormField(
                                                //   // controller:
                                                //   //     viewModel.lastNameController,
                                                //   inputFormatters: [
                                                //     FilteringTextInputFormatter.allow(
                                                //         RegExp('[a-zA-Z]')),
                                                //   ],
                                                //   // validator: (value){
                                                //   //   return  Validator.validateFormField(
                                                //   //       value!,
                                                //   //       strErrorEmptyLastName,
                                                //   //       strInvalidLastName,
                                                //   //       Constants.NORMAL_VALIDATION);
                                                //   // },
                                                //   keyboardType: TextInputType.name,
                                                //   textInputAction:
                                                //       TextInputAction.done,
                                                //   obscureText: false,
                                                //   decoration: const InputDecoration(
                                                //     hintText: 'Last Name',
                                                //   ),
                                                // ),
                                        // TextFormField(
                                        //   // controller: viewModel.passController,
                                        //   // obscureText: viewModel.passenable,
                                        //   keyboardType: TextInputType.name,
                                        //   textInputAction: TextInputAction.done,
                                        //   validator: (val) {
                                        //     if (val!.isEmpty) {
                                        //       return strEmptyPassword;
                                        //     } else if (val.length < 6) {
                                        //       return strInvalidPassword;
                                        //     }
                                        //     return null;
                                        //   },
                                        //   decoration: InputDecoration(
                                        //       hintText: 'Password',
                                        //       suffixIcon: IconButton(
                                        //           onPressed: () {
                                        //             //add Icon button at end of TextField
                                        //             // if (viewModel.passenable) {
                                        //             //   //if viewModel.passenable == true, make it false
                                        //             //   viewModel.passenable = false;
                                        //             // } else {
                                        //             //   viewModel.passenable =
                                        //             //       true; //if viewModel.passenable == false, make it true
                                        //             // }
                                        //           },
                                        //           icon: const Icon(
                                        //             // viewModel.passenable == true
                                        //             //     ? Icons.visibility_off_outlined
                                        //             //     : Icons.remove_red_eye_outlined,
                                        //             Icons.remove_red_eye_outlined,
                                        //             color: AppColors.blackColor,
                                        //           ))),
                                        // ),

                                        // TextFormField(
                                        //   // controller: viewModel.confirmPassController,
                                        //   // obscureText: viewModel.confimPass,
                                        //   keyboardType: TextInputType.name,
                                        //   textInputAction: TextInputAction.done,
                                        //   validator: (val) {
                                        //     // if (val!.isEmpty) {
                                        //     //   return strEmptyPassword;
                                        //     // } else if (val !=
                                        //     //     viewModel.passController.text) {
                                        //     //   return 'Not Match';
                                        //     // } else if (val.length < 6) {
                                        //     //   return strInvalidPassword;
                                        //     // }
                                        //     // return null;
                                        //   },
                                        //   decoration: InputDecoration(
                                        //       hintText: 'Confirm Password',
                                        //       suffixIcon: IconButton(
                                        //           onPressed: () {
                                        //             //add Icon button at end of TextField
                                        //             // if (viewModel.confimPass) {
                                        //             //   //if passenable == true, make it false
                                        //             //   viewModel.confimPass = false;
                                        //             // } else {
                                        //             //   viewModel.confimPass =
                                        //             //       true; //if passenable == false, make it true
                                        //             // }
                                        //           },
                                        //           icon: const Icon(
                                        //             Icons.remove_red_eye_outlined,
                                        //             // viewModel.confimPass == true
                                        //             //     ? Icons.visibility_off_outlined
                                        //             //     : Icons.remove_red_eye_outlined,
                                        //             color: AppColors.blackColor,
                                        //           ))),
                                        // ),

                                        // TextFormField(
                                        //   // controller: viewModel.emailController,
                                        //   keyboardType: TextInputType.name,
                                        //   textInputAction: TextInputAction.done,
                                        //   validator: (value) {
                                        //     // return Validator.validateFormField(
                                        //     //     value!,
                                        //     //     strErrorEmptyEmail,
                                        //     //     strInvalidEmail,
                                        //     //     Constants.EMAIL_VALIDATION);
                                        //   },
                                        //   decoration: const InputDecoration(
                                        //     hintText: 'Email',
                                        //   ),
                                        // ),