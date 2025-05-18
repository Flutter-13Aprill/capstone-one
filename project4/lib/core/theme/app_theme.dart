import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:project4/core/text/text_styles.dart';
import 'package:project4/core/theme/app_palette.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppPalette.whiteColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppPalette.whiteColor,
      elevation: 1,
      centerTitle: true,
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppPalette.blueColor,
        textStyle: TextStyles.cairo60014,
        padding: EdgeInsets.zero,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppPalette.whiteColor,
        backgroundColor: AppPalette.blueColor,
        fixedSize: Size(327, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: TextStyles.cairo60020,
      ),
    ),

    //input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: _border(AppPalette.blueColor),
      enabledBorder: _border(AppPalette.unchecked),
      labelStyle: TextStyles.cairo70020,
      hintStyle: TextStyles.cairo40016,
    ),
    //Bottom Navigation Bar Theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppPalette.whiteColor,
      selectedItemColor: AppPalette.blueColor,
      unselectedItemColor: AppPalette.blackLight,
      type: BottomNavigationBarType.fixed,
      elevation: 1,
    ),
  );

  static OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color, width: 2),
    );
  }

  final defaultPinTheme = PinTheme(
    width: 48,
    height: 48,
    textStyle: TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1),
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );
}
