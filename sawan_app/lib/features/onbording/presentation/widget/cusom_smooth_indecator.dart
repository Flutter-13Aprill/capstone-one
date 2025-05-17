import 'package:flutter/material.dart';
import 'package:sawan_app/core/theme/app_palette.dart';
import 'package:sawan_app/features/onbording/data/onbording_model.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothIndecator extends StatelessWidget {
  const CustomSmoothIndecator({super.key, required this.controller});
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: onbordingData.length,
      effect: WormEffect(
        dotColor: AppPalette.blue,
        activeDotColor: AppPalette.primeryColorBlue,
      ), // your preferred effect
      onDotClicked: (index) {},
    );
  }
}
