import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomRichTextWidget extends StatelessWidget {
  final String normalText;
  final String linkText;
  final VoidCallback onTap;

  const CustomRichTextWidget({
    super.key,
    required this.normalText,
    required this.linkText,
    required this.onTap,
  });
  // A customizable RichText widget that combines regular text with a tappable link-style text.

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: normalText,
        style: const TextStyle(color: Colors.grey),
        children: [
          const TextSpan(text: " "),
          TextSpan(
            text: linkText,
            style: Theme.of(context).textTheme.bodyLarge,
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
