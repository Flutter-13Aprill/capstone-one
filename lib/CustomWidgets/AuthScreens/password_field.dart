import 'package:capstone1/Helpers/auth_methods.dart';
import 'package:capstone1/Styling/colors.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.passwordController,
    required this.label,
  });
  final TextEditingController passwordController;
  final String label;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordController,
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter your password please';
        } else if (!isValidPassword(widget.passwordController.text.trim())) {
          return 'Password must be at least 8 characters long and contain at least one uppercase letter';
        }
        return null;
      },
      decoration: InputDecoration(
        fillColor: lightGreen,
        filled: true,
        label: Text(
          widget.label,
          style: TextStyle(color: darkModeGreen, fontSize: 16),
        ),
        hintText: "••••••••",
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Image.asset('assets/images/eye.png'),
        ),
        suffixIconConstraints: BoxConstraints(maxHeight: 35, maxWidth: 35),
        suffixStyle: TextStyle(color: darkModeGreen),

        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}
