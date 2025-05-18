import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  bool isClickedPass = false;
  bool isClickedConfirmPass = false;
  bool isSelected = false;

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'email_required'.tr();
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'invalid_email'.tr();
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'password_required'.tr();
    }
    if (value.length < 6) {
      return 'password_min_length'.tr();
    }
    return null;
  }

  bool validateForm(GlobalKey<FormState> formKey) {
    return formKey.currentState?.validate() ?? false;
  }
}
