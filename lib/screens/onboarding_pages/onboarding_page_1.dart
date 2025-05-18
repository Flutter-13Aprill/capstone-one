import 'package:flutter/material.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

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
              text: "Welcome to the ",
              style: TextStyle(color: Colors.white, fontSize: 20),
              children: [
                TextSpan(
                  text: "lite version of Spotify",
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
