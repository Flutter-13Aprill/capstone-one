import 'package:flutter/material.dart';

class TextFormController extends StatefulWidget {
  const TextFormController({super.key});

  @override
  State<TextFormController> createState() => _TextFormControllerState();
}

class _TextFormControllerState extends State<TextFormController> {
  final keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return TextFormField();
  }
}
