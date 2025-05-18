import 'package:flutter/material.dart';

// -- Extensions
import 'package:shabah/extensions/screen_size.dart';

class OnboardingPageView extends StatelessWidget {

  /// [OnboardingPageView] A reusable widget for displaying a single onboarding page.
  /// 
  /// Shows a [title] and a [deception] text with styling and spacing.
  const OnboardingPageView({
    super.key,
    required this.title,
    required this.deception,
  });
  final String title;
  final String deception;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        SizedBox(height: context.getHeight(multiplied: 0.016)),
        Text(deception, style: Theme.of(context).textTheme.displayMedium),
      ],
    );
  }
}
