import 'package:flutter/material.dart';

class TextTextfield extends StatelessWidget {
  const TextTextfield({super.key, required this.hintText});
  final String hintText;

  @override
  Widget build(BuildContext context) {
    TextEditingController textFieldController = TextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        controller: textFieldController,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 1.5),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
