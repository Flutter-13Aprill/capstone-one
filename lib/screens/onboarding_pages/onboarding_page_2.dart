import 'package:flutter/material.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/background_image.png"),
          SizedBox(height: 32),
          RichText(
                      text: TextSpan(
          text: "Test the ",
          style: TextStyle(color: Colors.white, fontSize: 20),
          children: [
            TextSpan(
              text: "New Experience",
              style: TextStyle(color: Colors.lightGreen, fontSize: 20),
            ),
          ],
                      ),
                    ),
        ],
      ),
    );
  }
}