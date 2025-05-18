import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SignupController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  bool isClickedPass = false;
  bool isClickedConfirmPass = false;
  bool isSelected = false;

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'username_required'.tr();
    }
    return null;
  }

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

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'confirm_password_required'.tr();
    }
    if (value != passController.text) {
      return 'passwords_do_not_match'.tr();
    }
    return null;
  }

  bool validateForm(GlobalKey<FormState> formKey) {
    return formKey.currentState?.validate() ?? false;
  }
}
