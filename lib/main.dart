import 'package:capstone1/Screens/onboarding_screen.dart';
import 'package:capstone1/Styling/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(scaffoldBackgroundColor: mainGreen),
      home: OnboardingScreen(),
    );
  }
}
