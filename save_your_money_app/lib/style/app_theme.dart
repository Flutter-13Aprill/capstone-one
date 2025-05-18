import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.green,
    scaffoldBackgroundColor: AppColors.background,
    cardColor: AppColors.darkGray,
    fontFamily: 'Tajawal',
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.background,
      iconTheme: IconThemeData(color: AppColors.beige),
      titleTextStyle: TextStyle(
        color: AppColors.beige,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.beige),
      bodyMedium: TextStyle(color: AppColors.beige),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.beige,
      foregroundColor: AppColors.green,
    ),
  );
}
