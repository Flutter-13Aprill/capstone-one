import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  /// A widget that displays a title text aligned left for English
  /// and right for Arabic, adapting to the current locale.
  const TitleWidget({super.key, required this.textTitle});

  /// The title text to display
  final String textTitle;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          context.locale.languageCode == 'en'
              ? Alignment.centerLeft
              : Alignment.centerRight,
      child: Text(textTitle, style: Theme.of(context).textTheme.headlineLarge),
    );
  }
}
