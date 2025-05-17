import 'package:flutter/material.dart';
import 'package:riyadh_transportation/screen/signin_screen.dart';

class SplashController {
  static splash(context) {
    // Wait for 5 seconds, then navigate to IntrosScreen
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SigninScreen()),
      );
    });
  }
}
