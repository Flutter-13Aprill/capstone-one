import 'package:flutter/material.dart';
import 'dart:async';
import 'package:taskins_stress_relief_app/themes/styles/app_colors.dart';
import 'package:taskins_stress_relief_app/themes/styles/app_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<String> cats = [
    "lib/assets/images/amazing_cat.png",
    "lib/assets/images/loving_cat.png",
    "lib/assets/images/meh_cat.png",
    "lib/assets/images/party_cat.png",
    "lib/assets/images/silly_cat.png"
  ];

  int currentIndex = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % cats.length;
      });
    });

    // Navigate to the signup screen after 5 seconds
    Future.delayed(const Duration(seconds: 8), () {
      Navigator.pushReplacementNamed(context, '/signup');
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightOrange,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(cats[currentIndex], width: 250),
              const SizedBox(height: 5),
              Text("Welcome to", style: AppFonts.fontSizeOne),
              Text("Taskins", style: AppFonts.fontSizeThree),
            ],
          ),
        ),
      ),
    );
  }
}
