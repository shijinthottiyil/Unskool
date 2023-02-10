import 'package:flutter/material.dart';
import 'package:unskool/utils/const/const_colors.dart';

class DarkTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: kBlack,
    appBarTheme: const AppBarTheme(
      color: kBlack,
    ),
    inputDecorationTheme: const InputDecorationTheme(
        prefixIconColor: kWhite,
        suffixIconColor: kWhite,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: kWhite,
        ))),
    textTheme: const TextTheme(
      titleMedium: TextStyle(color: kWhite),
      bodyLarge: TextStyle(
        color: kWhite,
      ),
      bodyMedium: TextStyle(
        color: kWhite,
      ),
      bodySmall: TextStyle(
        color: kWhite,
      ),
    ),
  );
}
