import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:unskool/service/service_signin.dart';
import 'package:unskool/model/siginin/signin_req_model.dart';
import 'package:unskool/view/screen/screen_home.dart';
import 'package:unskool/view/screen/screen_signup.dart';

class ProviderSignInScreen with ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  //FUNCTION TO GOTO SIGNUP SCREEN
  goToScreenSignUp(BuildContext context) {
    Navigator.push(
        context,
        PageTransition(
            child: ScreenSignUp(), type: PageTransitionType.rightToLeft));
  }

//VALIDATION
  String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter email';
    } else if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value)) {
      return 'Please enter correct email';
    } else {
      return null;
    }
  }

  String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password ';
    } else if (value.length < 6) {
      return 'Please enter 6 letter password';
    } else {
      return null;
    }
  }

//FUNCTION FOR ELEVATED BUTTON
  Future<void> signInButtonFn(BuildContext context) async {
    SignInReqModel signIn = SignInReqModel(
        email: emailController.text, password: passwordController.text);
    ServiceSignIn().signIn(signIn, context).then((value) {
      if (value!.loggedIn == true) {
        storage.write(key: 'jwtToken', value: value.jwtToken);

        Navigator.pushReplacement(
          context,
          PageTransition(
            child: const ScreenHome(),
            type: PageTransitionType.rightToLeftWithFade,
          ),
        );
      }
    });
  }
}
