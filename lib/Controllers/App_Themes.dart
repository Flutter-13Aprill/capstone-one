import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData darkTheme = ThemeData.dark();
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Color(0xFFC3DAFE),
    ),
    scaffoldBackgroundColor: const Color(0xFFC3DAFE),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Color(0xFF5D3A86),
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    
    ),
  );

  static BoxDecoration get gradientBackground => const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFC3DAFE),
            Color(0xFFFFC3D2),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      );

  static const LinearGradient titleGradient = LinearGradient(
    colors: [
      Color(0xFF836FFF),
      Color(0xFFBFA0FF),
   
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
