import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SignupController {
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  static TextEditingController emailController = TextEditingController();
  static TextEditingController passController = TextEditingController();
  static TextEditingController confirmpassController = TextEditingController();

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

  static passwordValidator(value) {
    if (value == null || value.isEmpty) {
      return "Password is Empty".tr();
    } else if (value.length < 6) {
      return "Password must be at least 6 characters long. Please try again"
          .tr();
    } else if (passController.text != passController.text) {
      return "Password & Confirm Password do not match".tr();
    } else {
      return null;
    }
  }
}
