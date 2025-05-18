import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData prefixIcon;
  final String? Function(String?)? validator;
  final bool obscureText;
  final VoidCallback? onSuffixIconPressed;
  final IconData? suffixIcon;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    this.validator,
    this.obscureText = false,
    this.onSuffixIconPressed,
    this.suffixIcon,
  });
  // A reusable text field widget with customizable icons, validation, and styling — suitable for login, registration, or form inputs.

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,

      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(prefixIcon, color: Colors.grey),
        suffixIcon:
            suffixIcon != null
                ? IconButton(
                  icon: Icon(suffixIcon, color: Colors.grey),
                  onPressed: onSuffixIconPressed,
                )
                : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Theme.of(context).cardColor),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Theme.of(context).cardColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
