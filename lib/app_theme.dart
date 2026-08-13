import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryLight = Color(0xFF0E3A99);
  static const Color primaryDark = Color(0xFF457AED);
  static const Color backgroundLight = Color(0xFFF4F7FF);
  static const Color backgroundDark = Color(0xFF001440);
  static const Color white = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0xFFF0F0F0);
  static const Color grey = Color(0xFFB9B9B9);
  static const Color darkGrey = Color(0xFF686868);
  static const Color black = Color(0xFF1C1C1C);
  static const Color red = Color(0xFFFF3232);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: backgroundLight,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(fontSize: 18, fontWeight: .w500, color: black),
      centerTitle: true,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: .fixed,
      backgroundColor: white,
      selectedItemColor: primaryLight,
      unselectedItemColor: grey,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryLight,
      foregroundColor: white,
      shape: CircleBorder()
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(fontSize: 20, fontWeight: .w500),
      titleMedium: TextStyle(fontSize: 16, fontWeight: .w500),
      titleSmall: TextStyle(fontSize: 14, fontWeight: .w400),
    )
  );

  static ThemeData darkTheme = ThemeData();
}
