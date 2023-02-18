import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:unskool/utils/const/const_url.dart';
import 'package:unskool/model/siginin/signin_req_model.dart';
import 'package:unskool/model/siginin/signin_res_model.dart';
import 'package:unskool/utils/exception/exceptions.dart';

class ServiceSignIn {
  Dio dio = Dio();

  Future<SignInResModel?> signIn(
    SignInReqModel signInReqModel,
    BuildContext context,
  ) async {
    try {
      Response response = await dio.post(logIn, data: signInReqModel.toJson());
      if (response.statusCode == 200) {
        log(response.data.toString());

        final SignInResModel signInResModel =
            SignInResModel.fromJson(response.data);
        return signInResModel;
      }
    } on DioError catch (e) {
      log(e.message);
      log('error');
      log(e.response!.statusCode.toString());
      Exceptions().exceptions(e, context);
    }
    return null;
  }
}
