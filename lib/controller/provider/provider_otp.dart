import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:unskool/controller/provider/provider_signup.dart';
import 'package:unskool/model/otp/otp_req.dart';
import 'package:unskool/service/service_verfifyotp.dart';
import 'package:unskool/view/screen/screen_signin.dart';

class ProviderOtp with ChangeNotifier {
  final TextEditingController controller1 = TextEditingController();

  final TextEditingController controller2 = TextEditingController();

  final TextEditingController controller3 = TextEditingController();

  final TextEditingController controller4 = TextEditingController();

  String? userResId;

  Future<void> submitButtonFn(BuildContext context) async {
    log('Otp Submit button Function');
    log(userResId.toString());
    final String otp =
        '${controller1.text}${controller2.text}${controller3.text}${controller4.text}';
    log(otp);
    OtpReqModel otpReqModel = OtpReqModel(userId: userResId!, otp: otp);

    ServiceVerifyOtp().verifyOtp(otpReqModel, context).then((value) {
      log(value!.message);
      if (value.message == "success") {
        final providerWOL = Provider.of<ProviderSignUp>(context, listen: false);
        providerWOL.nameController.clear();
        providerWOL.emailController.clear();
        providerWOL.passwordController.clear();
        providerWOL.confirmPasswordController.clear();

        controller1.clear();
        controller2.clear();
        controller3.clear();
        controller4.clear();

        Navigator.pushReplacement(
          context,
          PageTransition(
              child: ScreenSignIn(),
              type: PageTransitionType.rightToLeftWithFade),
        );
      }
    });

    log('submitButtonFn');

    log(otp);
  }
}
