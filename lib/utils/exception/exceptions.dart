import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:unskool/utils/exception/exception_snackbar.dart';

class Exceptions {
  void exceptions(Object e, BuildContext context) {
    if (e is DioError) {
      if (e.response?.statusCode == 400) {
        ExceptionSnackbar().exceptionSnackbar(context, 'Wrong otp');
      } else if (e.response?.statusCode == 403) {
        ExceptionSnackbar().exceptionSnackbar(context, 'wrong password');
      } else if (e.response?.statusCode == 409) {
        ExceptionSnackbar().exceptionSnackbar(context, 'email already exists');
      } else if (e.response?.statusCode == 500) {
        ExceptionSnackbar().exceptionSnackbar(context, 'email already exists');
      } else if (e.response?.statusCode == 554) {
        ExceptionSnackbar().exceptionSnackbar(context, 'email not exist');
      } else {
        log('no internet is got');
      }
    } else if (e is SocketException) {
      ExceptionSnackbar().exceptionSnackbar(context, 'No Internet Connection');
    }
    // if (e is SocketException) {
    //   if (e.osError!.errorCode == 101)
    //     ScaffoldMessenger.of(context)
    //         .showSnackBar(SnackBar(content: Text("no internet")));
    // }
  }
}
