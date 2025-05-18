import 'package:flutter/material.dart';

class CustomThemeApp {
  static final defaultTheme = ThemeData(
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),

      shadowColor: Colors.black,
      elevation: 5.0,

      backgroundColor: Color.fromARGB(255, 245, 245, 220),
      toolbarHeight: 100,
    ),
  );
}
