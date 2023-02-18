import 'package:flutter/material.dart';
import 'package:unskool/utils/const/const_colors.dart';

class DarkTheme {
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: kBlack,
    appBarTheme: const AppBarTheme(
      color: kBlack,
      actionsIconTheme: IconThemeData(
        color: kWhite,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      prefixIconColor: kWhite,
      suffixIconColor: kWhite,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: kWhite,
        ),
      ),
    ),
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
      labelMedium: TextStyle(
        color: kWhite,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: kBlack,
      selectedItemColor: kWhite,
      unselectedItemColor: kWhite.withOpacity(0.5),
      selectedLabelStyle: const TextStyle(
        fontFamily: 'Inter',
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(
        fontFamily: 'Inter',
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    ),
    iconTheme: const IconThemeData(
      color: kWhite,
    ),
  );
}
