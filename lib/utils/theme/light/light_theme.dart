import 'package:flutter/material.dart';
import 'package:unskool/utils/const/const_colors.dart';

class LightTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      color: kWhite,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      prefixIconColor: kBlack,
      suffixIconColor: kBlack,
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(color: kBlack),
      bodyLarge: TextStyle(
        color: kBlack,
      ),
      bodyMedium: TextStyle(
        color: kBlack,
      ),
      bodySmall: TextStyle(
        color: kBlack,
      ),
    ),
  );
}
