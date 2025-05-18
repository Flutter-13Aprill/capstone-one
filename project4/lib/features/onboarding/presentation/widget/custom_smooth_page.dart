import 'package:flutter/material.dart';
import 'package:project4/core/theme/app_palette.dart';
import 'package:project4/features/onboarding/data/model/onboarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothPage extends StatelessWidget {
  const CustomSmoothPage({super.key, required this.controller});
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: onboardingData.length,
      effect: WormEffect(
        activeDotColor: AppPalette.blueColor,
        dotColor: AppPalette.unchecked,
        dotHeight: 10,
        dotWidth: 10,
      ),
      onDotClicked: (index) {},
    );
  }
}
