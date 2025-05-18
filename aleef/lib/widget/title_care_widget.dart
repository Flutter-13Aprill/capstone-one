import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TitleCareWidget extends StatelessWidget {
  /// A widget that displays a title greeting aligned left for English
  /// and right for Arabic, adapting to the current locale.
  const TitleCareWidget({super.key, required this.titleName});

  /// The dynamic name to be shown next to the greeting.
  final String titleName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.0),
      // Determine alignment based on locale direction
      child: Align(
        alignment:
            context.locale.languageCode == 'en'
                ? Alignment.centerLeft
                : Alignment.centerRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 8,
              children: [
                Text(
                  "greeting".tr(),
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Text(
                  titleName,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ),
            Text(
              'question'.tr(),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
    );
  }
}
