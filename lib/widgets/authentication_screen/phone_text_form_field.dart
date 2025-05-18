import 'package:flutter/material.dart';
import 'package:shabah/style/app_colors.dart';

class PhoneTextFormField extends StatelessWidget {
  const PhoneTextFormField({super.key, required this.controller, required this.labelText, this.onValidate});

  final TextEditingController controller;
  final String labelText;
  final String? Function(String? value)? onValidate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: onValidate,
      keyboardType: TextInputType.number,
      maxLength: 10,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Color(0xff7F7F7F)),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 2,
            color: AppColors.borderTextFieldColor,
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 2,
            color: AppColors.borderTextFieldColor,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 2,
            color: AppColors.borderTextFieldColor,
          ),
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 2,
            color: AppColors.borderTextFieldColor,
          ),
        ),
      ),
    );
  }
}
