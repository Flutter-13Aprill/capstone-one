import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project4/core/extension/git_size_screen.dart';
import 'package:project4/core/function/navigaation.dart';
import 'package:project4/features/onboarding/presentation/page/onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (time) {
      customPushReplacement(context, OnboardingPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: context.getWidth() * 0.56,
              child: Image.asset("asset/image/splash.png", fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }
}
