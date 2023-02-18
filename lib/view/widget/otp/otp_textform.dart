import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unskool/utils/const/const_colors.dart';

class OtpTextForm extends StatelessWidget {
  final TextEditingController controller;
  final bool isAutoFocus;
  // final bool isFirst;
  // final bool isLast;
  const OtpTextForm({
    super.key,
    required this.controller,
    required this.isAutoFocus,
    // required this.isLast,
    // required this.isFirst,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      width: 64,
      child: TextFormField(
        autofocus: isAutoFocus,
        controller: controller,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        decoration: const InputDecoration(
          hintText: '0',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: kWhite,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: kWhite,
              width: 2,
            ),
          ),
        ),
        style: Theme.of(context).textTheme.titleLarge,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '';
          }
          return null;
        },
      ),
    );
  }
}
