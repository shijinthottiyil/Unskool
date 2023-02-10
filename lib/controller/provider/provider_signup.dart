import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:unskool/model/signup/signup_req_model.dart';
import 'package:unskool/service/service_signup.dart';
import 'package:unskool/view/screen/screen_home.dart';

class ProviderSignUp with ChangeNotifier {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isObscure = false;
//GOTO SIGNIN PAGE
  goToSignin(BuildContext context) {
    Navigator.pop(context);
  }

  //VALIDATION
  String? nameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    } else {
      return null;
    }
  }

  String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
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
      return 'Please enter password';
    } else if (value.length < 6) {
      return 'Please enter 6 letter password';
    } else {
      return null;
    }
  }

  String? confirmPasswordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter confirm password';
    } else if (value != passwordController.text) {
      return 'Password does not match';
    } else {
      return null;
    }
  }

  //HIDE TEXT IN PASSWORD
  void hideText() {
    if (!isObscure) {
      isObscure = true;
      notifyListeners();
    } else {
      isObscure = false;
      notifyListeners();
    }
  }

  //SIGNUP FUNCTION
  Future<void> signUpButtonFn(BuildContext context) async {
    // const String email = '@gmail.com';
    SignUpReqModel signUp = SignUpReqModel(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
    );
    await ServiceSignUp().signUp(signUp, context).then((value) {
      log('function signup button');
      log(value.toString());
      if (value!.status == 200) {
        log('user created in backend');
        log(value.status.toString());
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
