import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:unskool/view/screen/screen_bottomnav.dart';
import 'package:unskool/view/screen/screen_onboarding.dart';

class ProviderSplashScreen with ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? token;
  gotoInitialPage(BuildContext context) async {
    token = await storage.read(key: 'jwtToken');
    log(token.toString());
    // await storage.deleteAll();
    // token = await storage.read(key: 'jwtToken');
    // log(token.toString());

    Timer(const Duration(seconds: 3), () {
      if (token == null) {
        Navigator.pushReplacement(
          context,
          PageTransition(
            child: ScreenOnboarding(),
            type: PageTransitionType.rightToLeft,
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          PageTransition(
            child: const ScreenBottomnav(),
            type: PageTransitionType.rightToLeftWithFade,
          ),
        );
      }
    });
  }
}
