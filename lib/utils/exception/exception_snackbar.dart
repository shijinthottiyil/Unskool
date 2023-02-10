import 'package:flutter/material.dart';
import 'package:unskool/utils/const/const_colors.dart';

class ExceptionSnackbar {
  Future<void> exceptionSnackbar(BuildContext context, String content) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content, style: const TextStyle(color: kBlack)),
        backgroundColor: kRed,
      ),
    );
  }
}
