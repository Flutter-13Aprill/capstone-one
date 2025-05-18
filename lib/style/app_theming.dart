import 'package:flutter/material.dart';
import 'package:shabah/style/app_colors.dart';

class AppTheming {

  static final appTheming = ThemeData(

    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,

    textTheme: TextTheme(

      // -- Page View
      titleLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.secondaryColor
      ),

      // For buttons
      labelLarge: TextStyle(
        fontSize: 28,
        color: Colors.white
      ),

      labelMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColors.secondaryColor
      ),

      // For Services
      bodyMedium: TextStyle(
        fontSize: 18,
        color: AppColors.secondaryColor
      ),

      // -- Page view description & Remember me label, and OTP 
      displayMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.secondaryColor
      ),

      // Forget your password
      labelSmall: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w300,
        color: AppColors.secondaryColor
      )

      
    )
  );
}