
import 'package:coffee/style/app_colors.dart';
import 'package:flutter/material.dart';

class CustomThemeApp {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color.fromARGB(255, 248, 248, 248),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkGray,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.brown,
      secondary: AppColors.darkGray,
      
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkGray,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.ongray,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
    colorScheme: ColorScheme.dark(
      primary: AppColors.brown,
      secondary: AppColors.lightGray,
    ),
  );
}
