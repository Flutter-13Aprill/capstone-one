import 'package:flutter/material.dart';
import 'package:project4/core/function/navigaation.dart';
import 'package:project4/features/auth/presentation/page/otp_page.dart';

class AuthController {
  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final RegExp phoneRegExp = RegExp(r'^(?:[+0]9)?[0-9]{10}$');
  // final RegExp nameRegExp = RegExp(r'^[a-zA-Z]+ [a-zA-Z]+$');
  final nameRegExp = RegExp(r'^[\p{L} ]+$', unicode: true);

  String? phoneValidator(String? value) {
    if (value!.isEmpty) {
      return "Phone Number is Missing";
    } else if (!phoneRegExp.hasMatch(value)) {
      return "Invalid phone number";
    } else {
      return null;
    }
  }

  String? nameValidator(String? value) {
    if (value!.isEmpty) {
      return "name is Missing";
    } else if (!nameRegExp.hasMatch(value)) {
      return "Invalid Name";
    } else {
      return null;
    }
  }

  void moveToOtp(BuildContext context, GlobalKey<FormState> keys) {
    if (keys.currentState!.validate()) {
      customPushReplacement(context, OtpPage(controller: phoneController));
    }
  }
}
