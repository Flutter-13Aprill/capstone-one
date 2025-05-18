import 'package:flutter/material.dart';

// -- App Theming
import 'package:shabah/style/app_colors.dart';

class OnboardingPageIndicator extends StatelessWidget {

  /// [OnboardingPageIndicator] A row of dots indicating the current onboarding page.
  ///
  /// Highlights the active page by expanding its width and changing its color.
  const OnboardingPageIndicator({super.key, required int pageViewIndex}) : _pageViewIndex = pageViewIndex;
  final int _pageViewIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: List.generate(3, (index){
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: index == _pageViewIndex ? 30 : 10,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: index == _pageViewIndex ? AppColors.secondaryColor : Color(0xffB5B5B5)
          ),
        );
      })
    );
  }
}