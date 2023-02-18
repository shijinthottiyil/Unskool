import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:unskool/model/user/user_res_model.dart';
import 'package:unskool/utils/const/const_url.dart';

class ServiceUser {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Dio dio = Dio();

  Future<UserResModel?> getUserProfile() async {
    String? token = await storage.read(key: 'jwtToken');
    try {
      Response response = await dio.get(
        userProfileUrl,
        options: Options(headers: {'Authorization': token}),
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        log(response.data.toString());
        UserResModel userResModel = UserResModel.fromJson(response.data);
        return userResModel;
      }
    } on DioError catch (e) {
      log(e.response.toString());
      // Exceptions().exceptions(e, context);
      // Exceptions().exceptions(e, context);
    }
    return null;
  }
}
