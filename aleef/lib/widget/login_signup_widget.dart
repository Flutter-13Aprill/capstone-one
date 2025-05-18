import 'package:aleef/widget/line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LogInSignUpWidget extends StatelessWidget {
  /// Widget showing a question text with two lines and a tappable button text in the middle.
  const LogInSignUpWidget({
    super.key,
    required this.textQuestion,
    required this.textButtom,
    this.onTab,
  });

  /// The question text shown between the lines
  final String textQuestion;

  /// The tappable button text next to the question
  final String textButtom;

  /// Callback function triggered when the button text is tapped
  final Function()? onTab;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Line(),
        Text(
          textQuestion,
          style:
              context.locale.languageCode == 'en'
                  ? Theme.of(context).textTheme.headlineSmall
                  : TextStyle(fontSize: 16),
        ),
        Padding(
          padding: const EdgeInsets.all(0),
          child: TextButton(
            onPressed: onTab,
            child: Text(
              textButtom,
              style:
                  context.locale.languageCode == 'en'
                      ? Theme.of(context).textTheme.labelSmall
                      : TextStyle(fontSize: 16),
            ),
          ),
        ),
        Line(),
      ],
    );
  }
}
