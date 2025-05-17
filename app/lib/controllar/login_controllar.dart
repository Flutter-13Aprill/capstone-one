import 'package:app/main.dart';
import 'package:app/screen/bottom_navigation_bar_screen.dart';
import 'package:flutter/material.dart';

class LoginControllar {
  /// Handles the submission of the login form.
  void submitForm({
    required GlobalKey<FormState> formKey,
    required TextEditingController emailControllar,
    required TextEditingController passwordControllar,
    required BuildContext context,
  }) {
    // Check if the form is valid.
    if (formKey.currentState!.validate()) {
      // Get the entered email.
      String email = emailControllar.text;
      // Get the entered password.
      String password = passwordControllar.text;
      // For debugging purposes (currently commented out).
      // print('Email: $email, Password: $password');

      // Navigate to the bottom navigation bar screen, replacing the current screen in the navigation stack.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigationBarScreen()),
      );
    }
  }

  /// Returns a TextStyle based on the current dark theme setting.
  /// If the theme is not dark, it returns headlineLarge; otherwise, it returns titleSmall.
  TextStyle? isDarkThemTrue({required BuildContext context}) {
    return !isDarkThem
        ? Theme.of(context).textTheme.headlineLarge
        : Theme.of(context).textTheme.titleSmall;
  }
}