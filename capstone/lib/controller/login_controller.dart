import 'package:flutter/material.dart';

class LoginController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? validateEmail(String email) {
    if (email.isEmpty) return "Email is required";
    if (!RegExp(r"^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email)) {
      return "Enter a valid email";
    }
    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) return "Password is required";
    if (password.length < 6) return "Password must be at least 6 characters";
    return null;
  }

  bool isValid() {
    return validateEmail(emailController.text) == null &&
        validatePassword(passwordController.text) == null;
  }
}
