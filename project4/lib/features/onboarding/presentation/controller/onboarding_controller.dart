import 'package:flutter/material.dart';
import 'package:project4/core/function/navigaation.dart';
import 'package:project4/features/auth/presentation/page/login_page.dart';
import 'package:project4/features/onboarding/data/model/onboarding_model.dart';

class OnboardingController {
  final pageController = PageController();

  bool isLastPage(int index) {
    return index == onboardingData.length - 1;
  }

  void navigatorPage(BuildContext context, int index) {
    if (isLastPage(index)) {
      customPushReplacement(context, LoginPage());
    } else {
      pageController.nextPage(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    }
  }
}
