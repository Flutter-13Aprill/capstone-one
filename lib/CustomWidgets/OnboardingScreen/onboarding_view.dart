import 'package:capstone1/Helpers/screen_extinsion.dart';
import 'package:capstone1/Styling/colors.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final imageDiameter = context.screenHeight * 0.27;
    final circleDiameter = context.screenHeight * 0.1;

    return Stack(
      children: [
        Positioned(
          top: circleDiameter / 1.5,
          left: circleDiameter / 1.5,
          right: circleDiameter / 1.5,
          bottom: circleDiameter / 1.5,
          child: Container(
            clipBehavior: Clip.none,
            height: circleDiameter,
            width: circleDiameter,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: lightGreen,
            ),
          ),
        ),
        OverflowBox(
          maxHeight: imageDiameter,
          maxWidth: imageDiameter,
          child: Image.asset(
            imagePath,
            fit: BoxFit.fitWidth,
            height: imageDiameter,
            width: imageDiameter,
          ),
        ),
      ],
    );
  }
}
