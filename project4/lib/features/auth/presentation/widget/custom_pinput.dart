import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:project4/core/theme/app_theme.dart';

class CustomPinput extends StatelessWidget {
  const CustomPinput({super.key});

  @override
  Widget build(BuildContext context) {
    return Pinput(length: 6, defaultPinTheme: AppTheme().defaultPinTheme);
  }
}
