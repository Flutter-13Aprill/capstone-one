import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  /// A reusable text field widget with label, hint, and validation.
  const TextFieldWidget({
    super.key,
    required this.labelText,
    this.validate,
    required this.controller,
    required this.textHint,
  });

  /// Controller to manage the text input
  final TextEditingController controller;

  /// Label text shown above the input
  final String labelText;

  /// Hint text shown inside the text field
  final String textHint;

  /// validator function for input validation
  final String? Function(String?)? validate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      decoration: InputDecoration(
        labelText: labelText,
        hintText: textHint,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: validate,
    );
  }
}
