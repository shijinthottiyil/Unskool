import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unskool/controller/provider/provider_otp.dart';
import 'package:unskool/utils/const/const_colors.dart';
import 'package:unskool/view/widget/otp/otp_textform.dart';

class ScreenOtp extends StatelessWidget {
  final otpFormKey = GlobalKey<FormState>();
  final String userId;

  ScreenOtp({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    log(userId);

    return Consumer<ProviderOtp>(builder: (context, value, child) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            'Enter otp',
            style: TextStyle(
              fontFamily: 'Abhaya Libre',
              fontSize: 24.0,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Form(
              key: otpFormKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OtpTextForm(
                    controller: value.controller1,
                    isAutoFocus: true,
                  ),
                  OtpTextForm(
                    isAutoFocus: false,
                    controller: value.controller2,
                  ),
                  OtpTextForm(
                    isAutoFocus: false,
                    controller: value.controller3,
                  ),
                  OtpTextForm(
                    isAutoFocus: false,
                    controller: value.controller4,
                  ),
                ],
              ),
            ),
            Container(
              height: height * 0.09,
              width: width * 0.86,
              decoration: const BoxDecoration(
                color: kWhite,
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: kBlack,
                ),
                onPressed: () {
                  if (otpFormKey.currentState!.validate()) {
                    value.submitButtonFn(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: kWhite,
                        content: Text('Please enter otp'),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
