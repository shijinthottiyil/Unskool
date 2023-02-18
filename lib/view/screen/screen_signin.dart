import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:unskool/utils/const/const_colors.dart';
import 'package:unskool/utils/const/const_textstyle.dart';
import 'package:unskool/controller/provider/provider_signinscreen.dart';
import 'package:unskool/view/widget/signin/signin_textform.dart';

import '../widget/widget_row.dart';

class ScreenSignIn extends StatelessWidget {
  ScreenSignIn({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final providerWL = Provider.of<ProviderSignInScreen>(context);
    final providerWOL =
        Provider.of<ProviderSignInScreen>(context, listen: false);
    var height = MediaQuery.of(context).size.height;
    var obscure = providerWL.isObscure;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Sign In',
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
            const WidgetRow(
              listWidget: [
                Text(
                  'By Using our services you are agreeing to our\n\t\t\t\t\t\t\t\t\t\t\t\tTerms and Privacy Statement',
                ),
              ],
            ),
            const Spacer(flex: 2),
            Consumer<ProviderSignInScreen>(builder: (context, value, child) {
              return Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SigninTextForm(
                      maxLength: 30,
                      hintText: 'Enter Your Email',
                      prefixIcon: const FaIcon(
                        FontAwesomeIcons.solidEnvelope,
                      ),
                      controller: value.emailController,
                      validator: (data) {
                        return value.emailValidation(data);
                      },
                      obscureText: false,
                    ),
                    SigninTextForm(
                      hintText: 'Enter Your Password',
                      prefixIcon: const FaIcon(FontAwesomeIcons.lock),
                      controller: value.passwordController,
                      validator: (data) {
                        return value.passwordValidation(data);
                      },
                      obscureText: providerWOL.isObscure,
                      suffixIcon: IconButton(
                        onPressed: () {
                          providerWOL.hidePassword();
                        },
                        icon: FaIcon(
                          obscure
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
            SizedBox(
              height: height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kWhite,
                    foregroundColor: kBlack,
                    textStyle: const TextStyle(
                      color: kWhite,
                      fontSize: 25,
                      fontStyle: FontStyle.normal,
                    ),
                    shape: const BeveledRectangleBorder(),
                    padding: const EdgeInsets.all(15),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      providerWOL.signInButtonFn(context);
                    }
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(flex: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'New here?',
                  style: textStyleSml,
                ),
                TextButton(
                  onPressed: () {
                    providerWOL.goToScreenSignUp(context);
                  },
                  child: const Text(
                    'Create an account',
                    style: textStyleSmlPurple,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
