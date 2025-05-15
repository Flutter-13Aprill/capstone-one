import 'package:capstone1/Helpers/auth_methods.dart';
import 'package:capstone1/Styling/colors.dart';
import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  const EmailField({super.key, required this.emailController});
  final TextEditingController emailController;

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter your email address please';
        } else if (!isValidEmail(widget.emailController.text.trim())) {
          return 'Enter a valid email address';
        }
        return null;
      },
      decoration: InputDecoration(
        fillColor: lightGreen,
        filled: true,
        label: Text(
          'Email',
          style: TextStyle(color: darkModeGreen, fontSize: 16),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}
