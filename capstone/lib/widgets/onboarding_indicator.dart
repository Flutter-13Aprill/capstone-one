import 'package:capstone/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

class OnboardingIndicator extends StatefulWidget {
  const OnboardingIndicator({super.key, required this.curretPage});

final int curretPage;


// here is onboarding indicator to give style and navigate the current page

  @override
  State<OnboardingIndicator> createState() => _OnboardingIndicatorState();
}

class _OnboardingIndicatorState extends State<OnboardingIndicator> {
  @override
  Widget build(BuildContext context) {
    return Row( mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
    3,
    (index) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: AnimatedContainer(
        curve: Curves.easeIn,
        duration: Duration(microseconds: 500),
        //give current page extra width
        width: index == curretPage ? 21 : 8,
        height: 8,
        decoration: BoxDecoration(
          color:
          //change color on select
              index == curretPage
                  ? Colors.purple
                  : Color.fromARGB(225, 123, 128, 133),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
          ),);
  }
}