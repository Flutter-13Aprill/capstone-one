import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riyadh_transportation/screen/bottom_navigation_screen.dart';
import 'package:riyadh_transportation/screen/signup_screen.dart';

class SigninController {
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  static TextEditingController emailController = TextEditingController();
  static TextEditingController passController = TextEditingController();

  static emailValidator(value) {
    if (value == null || value.isEmpty) {
      return "eamil is empty".tr();
    } else if (!value.contains(
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$'),
    )) {
      return "Please enter a valid email address".tr();
    }
    return null;
  }

  static passwordValidator(value, context) {
    if (value == null || value.isEmpty) {
      return "Password is Empty".tr();
    } else if (value.length < 6) {
      return "Password must be at least 6 characters long. Please try again"
          .tr();
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => BottomNavigationScreen()),
      );
      return null;
    }
  }

  static signupScreen(context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => SignupScreen()));
  }
}
