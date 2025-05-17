import 'package:flutter/material.dart';
import 'package:jojo_bakery/theme/app_colors.dart';

class AppThem {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.white,
    fontFamily: 'Alexandria',

    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.text, fontSize: 16),
      bodyMedium: TextStyle(color: AppColors.secondText, fontSize: 14),
      titleLarge: TextStyle(color: AppColors.secondText, fontSize: 12),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.cardColors,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.primary),
      titleTextStyle: TextStyle(
        color: AppColors.text,
        fontSize: 16,
        fontFamily: 'Alexandria',
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
