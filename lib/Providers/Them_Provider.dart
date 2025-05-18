// lib/Providers/theme_provider.dart
import 'package:app_design_implementation/Controllers/App_Themes.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = true;
  bool get isDarkMode => _isDarkMode;

  ThemeData get currentTheme => _isDarkMode ? AppThemes.darkTheme : AppThemes.lightTheme;

  void toggleTheme(bool val) {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void setTheme(bool isDark) {
    _isDarkMode = isDark;
    notifyListeners();
  }
}
