import 'package:flutter/material.dart';
import 'package:sawan_app/core/function/navigation.dart';
import 'package:sawan_app/core/theme/app_palette.dart';

import 'package:sawan_app/features/onbording/presentation/pages/onbording_screen.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      customReplacmentNaviagte(context, OnbordingScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.primeryColorBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 72,
              width: 151.88,
              child: Image.asset(
                "assets/images/Sawan Logo.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
