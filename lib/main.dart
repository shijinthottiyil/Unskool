import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unskool/controller/provider/provider_bottomnav.dart';
import 'package:unskool/controller/provider/provider_featured.dart';
import 'package:unskool/controller/provider/provider_onboarding.dart';
import 'package:unskool/controller/provider/provider_otp.dart';
import 'package:unskool/controller/provider/provider_signinscreen.dart';
import 'package:unskool/controller/provider/provider_signup.dart';
import 'package:unskool/controller/provider/provider_splashscreen.dart';
import 'package:unskool/utils/theme/dark/dark_theme.dart';
import 'package:unskool/view/screen/screen_bottomnav.dart';
import 'package:unskool/view/screen/screen_onboarding.dart';
import 'package:unskool/view/screen/screen_otp.dart';
import 'package:unskool/view/screen/screen_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return ProviderSplashScreen();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return ProviderSignInScreen();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return ProviderSignUp();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return ProviderOnboarding();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return ProviderBottomnav();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return ProviderFeature();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return ProviderOtp();
          },
        ),
      ],
      child: MaterialApp(
        title: 'UNSKOOL',
        debugShowCheckedModeBanner: false,
        theme: DarkTheme.darkTheme,
        // theme: lightThemeData,
        // darkTheme: DarkTheme.darkTheme,
        // themeMode: ThemeMode.system,
        home: const ScreenSplash(),
      ),
    );
  }
}
