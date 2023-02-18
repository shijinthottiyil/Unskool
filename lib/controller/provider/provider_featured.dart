import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:unskool/service/service_user.dart';

class ProviderFeature with ChangeNotifier {
  String? name;

  Future<void> getName() async {
    await ServiceUser().getUserProfile().then((value) {
      if (value != null) {
        name = value.userDetails.name;
        notifyListeners();
        log(name.toString());
      }
    });
  }
}
