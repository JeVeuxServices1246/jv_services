import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant/color.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  final int? maxLength;
  final int? maxLines;
  final TextInputType? inputType;
  final bool? isEnabled;
  final onTap;
  final bool? obscureText;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final validator;
  const CustomTextField(
      {super.key,
      this.hintText,
      required this.controller,
      this.maxLength,
      this.maxLines,
      this.onTap,
      this.inputType,
      this.isEnabled,
      this.obscureText,
      this.suffixIcon,
      this.contentPadding,
      this.textInputAction,
      this.inputFormatters,
      this.onChanged,
      this.focusNode,
      this.validator,
      this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xff79747E))),
      child: TextFormField(
        maxLength: maxLength,
        keyboardType: textInputType,
        enabled: isEnabled,
        obscureText: obscureText ?? false,
        textInputAction: textInputAction,
        validator: validator,
        maxLines: maxLines,
        controller: controller,
        style: const TextStyle(
            fontSize: 16,
            color: AppColors.textBlackColor,
            fontWeight: FontWeight.w600,
            fontFamily: popionsBold),
        cursorColor: const Color(0xff79747E),
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            border: InputBorder.none,
            labelText: hintText,
            labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff79747E),
                fontFamily: popionsMedium)),
      ),
    );
  }
}
