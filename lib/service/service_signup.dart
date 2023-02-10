import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:unskool/utils/const/const_url.dart';
import 'package:unskool/model/signup/signup_req_model.dart';
import 'package:unskool/model/signup/signup_res_model.dart';
import 'package:unskool/utils/exception/exceptions.dart';

class ServiceSignUp {
  Dio dio = Dio();

  Future<SignUpResModel?> signUp(
    SignUpReqModel signUpReqModel,
    BuildContext context,
  ) async {
    try {
      Response response =
          await dio.post(signUpUrl, data: jsonEncode(signUpReqModel.toJson()));
      if (response.statusCode == 200) {
        log('status code is 200');
        log(response.data.toString());
        SignUpResModel signUpResModel = SignUpResModel.fromJson(response.data);
        log(signUpResModel.toString());
        return signUpResModel;
      }
    } on DioError catch (e) {
      log('signup error');
      log(e.message);
      log(e.response.toString());
      Exceptions().exceptions(e, context);
    }
    return null;
  }
}
