import 'package:flutter/material.dart';
import 'package:unskool/utils/const/const_colors.dart';
import 'package:unskool/utils/const/const_textstyle.dart';

class SigninTextForm extends StatelessWidget {
  final String hintText;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? suffixText;
  final Widget? suffixIcon;
  final bool? obscureText;
  final void Function()? onTap;
  final int? maxLength;
  const SigninTextForm({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    required this.validator,
    this.suffixText,
    this.suffixIcon,
    required this.obscureText,
    this.onTap,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      obscureText: obscureText ?? false,
      maxLength: maxLength ?? 10,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        suffixText: suffixText,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: suffixIcon,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: prefixIcon,
        ),
        hintText: hintText,
        hintStyle: textStyleSml,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
            color: kWhite,
            width: 2,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
            color: kWhite,
            width: 2,
          ),
        ),
      ),
    );
  }
}
