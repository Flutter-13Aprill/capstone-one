import 'package:flutter/material.dart';

class AuthController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isEmailValid(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  bool isPasswordValid(String password) {
    return password.length >= 6;
  }

  bool doPasswordsMatch(String password, String confirmPassword) {
    return password == confirmPassword;
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmPasswordController.dispose();
  }
}
