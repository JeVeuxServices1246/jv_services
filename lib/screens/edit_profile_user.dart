import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jv_services/utils/extensions/goto.dart';
import 'package:jv_services/utils/theme_extension.dart';
import 'package:jv_services/widget/base_widget.dart';

import '../constant/poppins_common_text.dart';
import '../constant/strings.dart';
import '../utils/Validator.dart';
import '../utils/constants.dart';
import '../view_models/edit_profile_user_vm.dart';

class EditProfileUser extends BaseWidget<EditProfileUserVM>{
  const EditProfileUser({super.key});

  @override
  Widget buildUI(BuildContext context, EditProfileUserVM viewModel) {
    Size size = context.mediaSize;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.adaptive.arrow_back,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: const PoppinsAddText(
          textAlign: TextAlign.start,
          text: AppStrings.profileTitle,
          fontSize: 20,
          letterSpacing: 1,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            left: 25,
            right: 25,
          ),
          child: Form(
            key: viewModel.upKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PoppinsAddText(
                  textAlign: TextAlign.start,
                  text: AppStrings.firstName,
                  fontSize: 12,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
                TextFormField(
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                  obscureText: false,
                  controller: viewModel.firstNameController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                  ],
                  validator: (value){
                    return  Validator.validateFormField(
                        value!,
                        strErrorEmptyFirstName,
                        strInvalidFirstName,
                        Constants.NORMAL_VALIDATION);
                  },
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: 'enter first name',
                    hintStyle: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const PoppinsAddText(
                  textAlign: TextAlign.start,
                  text: AppStrings.lastName,
                  fontSize: 12,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
                TextField(
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                  obscureText: false,
                  controller: viewModel.lastNameController,
                  decoration: InputDecoration(
                    hintText: 'enter last name',
                    hintStyle: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const PoppinsAddText(
                  textAlign: TextAlign.start,
                  text: AppStrings.email,
                  fontSize: 12,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
                TextField(
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                  obscureText: false,
                  controller: viewModel.emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'enter email',
                    hintStyle: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const PoppinsAddText(
                  textAlign: TextAlign.start,
                  text: AppStrings.mobileNo,
                  fontSize: 12,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
                TextField(
                  controller:viewModel.numberController,
                  keyboardType: TextInputType.number,
                  focusNode: AlwaysDisabledFocusNode(),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10)
                  ],
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'enter mobile no',
                    hintStyle: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  onChanged: (val) {
                    viewModel.numberCount = val.length;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0).copyWith(bottom: 26),
        child: ElevatedButton(
            onPressed: () {
              viewModel.updateProfile();
            },
            style: ElevatedButton.styleFrom(
                minimumSize: Size(size.width, 50),
                backgroundColor: viewModel.numberCount > 9
                    ? Colors.black
                    : const Color(0xffD8D8D8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: PoppinsAddText(
              textAlign: TextAlign.start,
              text: AppStrings.saveChange,
              fontSize: 14,
              letterSpacing: 1,
              fontWeight: FontWeight.w500,
              color: viewModel.numberCount > 9
                  ? Colors.white
                  : const Color(0xff858585),
            )),
      ),
    );
  }

}
class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}