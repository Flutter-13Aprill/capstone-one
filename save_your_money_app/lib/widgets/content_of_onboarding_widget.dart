import 'package:flutter/material.dart';
import 'package:save_your_money_app/utils/extensions/screen/screen_size.dart';

class ContentOfOnboardingWidget extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  const ContentOfOnboardingWidget({
    super.key,
    required this.description,
    required this.title,
    required this.imagePath,
  });
  // Onboarding screen widget showing an image, title, and description in a vertical layout.

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          height: context.getHeight(0.4),
          width: context.getWidth(1),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xffE2DBD0),
          ),
          textAlign: TextAlign.center,
        ),

        SizedBox(height: 16),

        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
