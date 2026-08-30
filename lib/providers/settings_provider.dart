import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = .light;
  String languageCode = 'en';

  bool get isDark => themeMode == .dark;

  void changeTheme(ThemeMode theme) {
    themeMode = theme;
    notifyListeners();
  }

  void changeLanguge(String languge) {
    if (languageCode == languge) return;
    languageCode = languge;
    notifyListeners();
  }
}
