import 'package:flutter/material.dart';

Color _darkMode = Colors.black;
Color _lightMode = Colors.white;

late Color colorMode;

bool themeMode = true;

changeTheme () {
  if(themeMode) {

    return colorMode = _darkMode;
  }
  else {
    return colorMode = _lightMode;
  }
}