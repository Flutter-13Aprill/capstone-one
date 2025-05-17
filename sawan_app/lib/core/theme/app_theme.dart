import 'package:flutter/material.dart';
import 'package:sawan_app/core/text/text_style.dart';
import 'package:sawan_app/core/theme/app_palette.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppPalette.primeryColorWhite,
    appBarTheme: AppBarTheme(backgroundColor: AppPalette.primeryColorWhite),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        iconColor: AppPalette.white,
        fixedSize: Size(302, 46),
        backgroundColor: AppPalette.primeryColorBlue,
        foregroundColor: AppPalette.primeryColorWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: TextStyles.alexandra400,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.all(TextStyles.alexandra400size14),
      ),
    ),
  );
}
