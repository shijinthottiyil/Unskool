import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:unskool/utils/const/const_colors.dart';
import 'package:unskool/utils/const/const_textstyle.dart';
import 'package:unskool/controller/provider/provider_signup.dart';
import 'package:unskool/view/widget/signup/signup_textform.dart';
import 'package:unskool/view/widget/widget_row.dart';

class ScreenSignUp extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  ScreenSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final providerWOL = Provider.of<ProviderSignUp>(context, listen: false);
    final providerWL = Provider.of<ProviderSignUp>(context);
    var obsure = providerWL.isObscure;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Create an account',
          style: TextStyle(
            fontFamily: 'Abhaya Libre',
            fontSize: 24.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            WidgetRow(
              listWidget: [
                Text(
                  "By clicking on “Create account” you agree to ort Terms\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tof Use and Privacy Policy.",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Consumer<ProviderSignUp>(builder: (context, value, child) {
              return Form(
                key: formKey,
                child: SizedBox(
                  width: double.infinity,
                  height: height * 0.45,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SignupTextform(
                        obscureText: false,
                        controller: value.nameController,
                        validator: (data) {
                          return value.nameValidation(data);
                        },
                        hintText: 'Enter Your Name',
                        prefixIcon: const FaIcon(
                          FontAwesomeIcons.solidUser,
                        ),
                      ),
                      SignupTextform(
                        obscureText: false,
                        validator: (data) {
                          return value.emailValidation(data);
                        },
                        controller: value.emailController,
                        hintText: 'Enter Your Email',
                        prefixIcon: const FaIcon(
                          FontAwesomeIcons.solidEnvelope,
                        ),
                        // suffixText: '@gmail.com',
                        maxLength: 30,
                      ),
                      SignupTextform(
                        obscureText: providerWOL.isObscure,
                        validator: (data) {
                          return value.passwordValidation(data);
                        },
                        controller: value.passwordController,
                        hintText: 'Enter Your Password',
                        prefixIcon: const FaIcon(
                          FontAwesomeIcons.lock,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            providerWL.hideText();
                          },
                          icon: FaIcon(
                            obsure
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash,
                          ),
                        ),
                      ),
                      SignupTextform(
                        obscureText: true,
                        validator: (data) {
                          return value.confirmPasswordValidation(data);
                        },
                        controller: value.confirmPasswordController,
                        hintText: 'Confirm Your Password',
                        prefixIcon: const FaIcon(
                          FontAwesomeIcons.lock,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            SizedBox(
              height: height * 0.04,
            ),
            Container(
              height: height * 0.09,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: kWhite,
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: kBlack,
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    log('validationnnn');
                    providerWOL.signUpButtonFn(context);
                  }
                },
                child: const Text(
                  'Create account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Have an account? ',
                  style: textStyleSml,
                ),
                TextButton(
                  onPressed: () {
                    Provider.of<ProviderSignUp>(context, listen: false)
                        .goToSignin(context);
                  },
                  child: const Text(
                    ' Sign In',
                    style: textStyleSmlPurple,
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
