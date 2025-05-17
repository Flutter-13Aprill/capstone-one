import 'package:flutter/material.dart';
import 'package:sawan_app/core/theme/app_palette.dart';

class CustomTextForm extends StatelessWidget {
  CustomTextForm({super.key, required this.controller, required this.text});

  final TextEditingController controller;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(text, style: TextStyle(color: Colors.grey)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        fillColor: AppPalette.white,
        filled: true,
      ),

      controller: controller,
      validator: (value) {
        return null;
      },
    );
  }
}
