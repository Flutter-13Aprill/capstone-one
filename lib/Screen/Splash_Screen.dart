import 'package:app_design_implementation/Screen/Started_Screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // Timer to navigate to the next screen after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => StartedScreen()),
      );
    });
    return Scaffold(
      body: SizedBox(
        width: double.infinity, // Takes up full screen width
        height: double.infinity, // Takes up full screen height
        child: FittedBox(
          fit:
              BoxFit
                  .cover, // Makes the image cover the screen while maintaining aspect ratio
          child: Image(
            image: AssetImage('assets/Logo.png'),
          ), // Display logo image
        ),
      ),
    );
  }
}
