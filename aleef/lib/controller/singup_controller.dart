import 'package:aleef/screens/bottom_navigation.dart';
import 'package:aleef/style/style_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Handles sign up form validation and submission.
class SingupController {
  /// Validates username must not be empty.
  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return "usernameRequired".tr();
    }
    return null;
  }

  /// Validates email must not be empty and must follow email format.
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "emailRequired".tr();
    } else if ((!value.contains(
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$'),
    ))) {
      return "emailInvalid".tr();
    }
    return null;
  }

  /// Validates password must be strong and not empty.
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "passwordRequired".tr();
    } else if ((!value.contains(
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'),
    ))) {
      return "passwordInvalid".tr();
    }
    return null;
  }

  /// Validates confirm password must match original password.
  String? validateConfirmPassword(
    TextEditingController passwordController,
    TextEditingController conpasswordController,
    String? value,
  ) {
    if (value == null || value.isEmpty) {
      return "confirmPasswordRequired".tr();
    } else if (passwordController.text != conpasswordController.text) {
      return "passwordsNotMatch".tr();
    }
    return null;
  }

  /// Submits the form shows a success message and navigates to HomeScreen.
  void onSubmit(BuildContext context, dynamic keyForm) {
    if (keyForm.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('formSubmitSuccess'.tr()),
          backgroundColor: StyleColor.mint,
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigation()),
      );
    }
  }
}
