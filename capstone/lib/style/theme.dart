import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryRed = Color(0xFFE92F48); // Red Vermilion Bird
  static const Color darkGrey = Color(0xFF424242); // Black Tortoise
  static const Color deepGrey = Color(0xFF7E8389); // Deep Grey
  static const Color lightBackground = Color(0xFFF2F2F2); // To-Go Container
}

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.primaryRed,
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryRed,
      onPrimary: Colors.white,
      background: Colors.white,
      onBackground: AppColors.darkGrey,
      secondary: AppColors.deepGrey,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: AppColors.darkGrey,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryRed,
        foregroundColor: Colors.white,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryRed,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightBackground,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryRed,
      secondary: AppColors.deepGrey,
    ),
  );
}
