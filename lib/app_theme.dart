import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryLight = Color(0xFF0E3A99);
  static const Color primaryDark = Color(0xFF457AED);
  static const Color backgroundLight = Color(0xFFF4F7FF);
  static const Color backgroundDark = Color(0xFF000F30);
  static const Color white = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0xFFF0F0F0);
  static const Color lightGrey = Color(0xFFE9EAEB);
  static const Color grey = Color(0xFFB9B9B9);
  static const Color darkGrey = Color(0xFF686868);
  static const Color black = Color(0xFF1C1C1C);
  static const Color red = Color(0xFFFF3232);
  static const Color green = Colors.green;
  static const Color navy = Color(0xFF001440);
  static const Color borderDark = Color(0xFF002D8F);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryLight,
    scaffoldBackgroundColor: backgroundLight,
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundLight,
      foregroundColor: black,
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
      shape: CircleBorder(),
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: .w600,
        color: primaryLight,
      ),
      headlineSmall: TextStyle(fontSize: 20, fontWeight: .w500),
      titleMedium: TextStyle(fontSize: 16, fontWeight: .w500),
      titleSmall: TextStyle(fontSize: 14, fontWeight: .w400),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: white,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: offWhite),
        borderRadius: BorderRadius.circular(16),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: offWhite),
        borderRadius: BorderRadius.circular(16),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: red),
        borderRadius: BorderRadius.circular(16),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: red),
        borderRadius: BorderRadius.circular(16),
      ),
      hintStyle: TextStyle(fontSize: 14, color: darkGrey, fontWeight: .w400),
    ),
    listTileTheme: ListTileThemeData(
      tileColor: white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: offWhite),
      ),
      titleTextStyle: TextStyle(fontSize: 16, fontWeight: .w500, color: black),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryLight,
        textStyle: TextStyle(
          fontSize: 14,
          fontWeight: .bold,
          decoration: .underline,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryLight,
        foregroundColor: white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: TextStyle(fontSize: 20, fontWeight: .w500),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryDark,
    scaffoldBackgroundColor: backgroundDark,
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundDark,
      foregroundColor: white,
      titleTextStyle: TextStyle(fontSize: 18, fontWeight: .w500, color: white),
      centerTitle: true,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: .fixed,
      backgroundColor: backgroundDark,
      selectedItemColor: primaryDark,
      unselectedItemColor: grey,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryDark,
      foregroundColor: white,
      shape: CircleBorder(),
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(fontSize: 24, fontWeight: .w600, color: white),
      headlineSmall: TextStyle(fontSize: 20, fontWeight: .w500, color: white),
      titleMedium: TextStyle(fontSize: 16, fontWeight: .w500, color: white),
      titleSmall: TextStyle(fontSize: 14, fontWeight: .w400, color: offWhite),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: navy,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderDark),
        borderRadius: BorderRadius.circular(16),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderDark),
        borderRadius: BorderRadius.circular(16),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: red),
        borderRadius: BorderRadius.circular(16),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: red),
        borderRadius: BorderRadius.circular(16),
      ),
      hintStyle: TextStyle(fontSize: 14, color: offWhite, fontWeight: .w400),
    ),
    listTileTheme: ListTileThemeData(
      tileColor: navy,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: borderDark),
      ),
      titleTextStyle: TextStyle(fontSize: 16, fontWeight: .w500, color: white),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryDark,
        textStyle: TextStyle(
          fontSize: 14,
          fontWeight: .bold,
          decoration: .underline,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryDark,
        foregroundColor: white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: TextStyle(fontSize: 20, fontWeight: .w500),
      ),
    ),
  );
}
