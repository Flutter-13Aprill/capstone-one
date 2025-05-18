import 'package:aleef/screens/bottom_navigation.dart';
import 'package:aleef/style/style_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Handles login form validation and submission.
class LoginController {
  /// Returns error message if value is empty otherwise null.
  String? validateEmpty(String? value, String message) {
    if (value == null || value.isEmpty) {
      return message;
    }
    return null;
  }

  /// Submits shows success message and navigates to HomeScreen.
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
