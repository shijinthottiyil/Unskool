import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:unskool/model/otp/otp_req.dart';
import 'package:unskool/model/otp/otp_res.dart';
import 'package:unskool/utils/const/const_url.dart';
import 'package:unskool/utils/exception/exceptions.dart';

class ServiceVerifyOtp {
  Dio dio = Dio();

  Future<OtpResModel?> verifyOtp(
      OtpReqModel otpReqModel, BuildContext context) async {
    log(otpReqModel.userId);
    log(otpReqModel.otp);
    log(otpReqModel.toJson().toString());
    try {
      log('try is working properly');
      Response response = await dio.post(
        verifyOtpUrl,
        data: jsonEncode(
          otpReqModel.toJson(),
        ),
        options: Options(validateStatus: (status) {
          return status! < 399;
        }),
      );
      log(response.data.toString());
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        OtpResModel otpResModel = OtpResModel.fromJson(response.data);
        return otpResModel;
      }

      log(response.data.toString());
    } on DioError catch (e) {
      log(e.message);

      Exceptions().exceptions(e, context);
    }
    return null;
  }
}
