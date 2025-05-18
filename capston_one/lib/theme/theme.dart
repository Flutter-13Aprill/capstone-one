import 'package:flutter/material.dart';
import 'style_color.dart';

class CustomTheme {
  static final ThemeData defaultTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 206, 207, 196),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.appBarColor,
    ),
  );
}
