import 'package:aleef/style/style_color.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  //lightTheme
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: StyleColor.clay,
      onPrimary: Colors.black,
      secondary: StyleColor.clay,
      onSecondary: Colors.grey,
      error: StyleColor.coral,
      onError: Colors.grey,
      surface: StyleColor.clay,
      onSurface: Colors.black,
    ),
    scaffoldBackgroundColor: StyleColor.lightSoft,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        alignment: Alignment.center,
        elevation: WidgetStateProperty.all(0),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        backgroundColor: WidgetStateProperty.all(StyleColor.clay),
        overlayColor: WidgetStatePropertyAll(Colors.grey.shade600),
      ),
    ),
    listTileTheme: ListTileThemeData(tileColor: Colors.white),
    appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: StyleColor.coral,
    ),
    iconTheme: IconThemeData(color: StyleColor.clay),

    fontFamily: 'Tajawal',
    textTheme: TextTheme(
      displayMedium: TextStyle(
        color: StyleColor.lightBlack,
        fontSize: 56,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        color: StyleColor.lightBlack,
        fontSize: 48,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: TextStyle(
        color: StyleColor.lightBlack,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: StyleColor.lightBlack,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        color: StyleColor.lightBlack,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: StyleColor.lightBlack,
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        color: StyleColor.lightBlack,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      labelMedium: TextStyle(
        color: StyleColor.lightSoft,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: TextStyle(
        color: StyleColor.clay,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  //darkMode
  static final darkMode = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: StyleColor.clay,
      onPrimary: StyleColor.darkSoft,
      secondary: StyleColor.clay,
      onSecondary: StyleColor.darkSoft,
      error: StyleColor.coral,
      onError: StyleColor.darkSoft,
      surface: StyleColor.clay,
      onSurface: StyleColor.darkSoft,
    ),
    scaffoldBackgroundColor: StyleColor.darkEarth,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        backgroundColor: WidgetStateProperty.all(StyleColor.clay),
        overlayColor: WidgetStatePropertyAll(Colors.grey.shade600),
      ),
    ),
    listTileTheme: ListTileThemeData(tileColor: Colors.grey),
    appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: StyleColor.coral,
    ),
    iconTheme: IconThemeData(color: StyleColor.clay),
    fontFamily: 'Tajawal',
    textTheme: TextTheme(
      displayMedium: TextStyle(
        color: StyleColor.darkSoft,
        fontSize: 56,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        color: StyleColor.darkSoft,
        fontSize: 48,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: TextStyle(
        color: StyleColor.darkSoft,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: StyleColor.darkSoft,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        color: StyleColor.darkSoft,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: StyleColor.darkSoft,
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        color: StyleColor.darkSoft,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      labelMedium: TextStyle(
        color: StyleColor.darkSoft,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: TextStyle(
        color: StyleColor.clay,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
