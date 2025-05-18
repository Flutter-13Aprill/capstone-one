import 'package:flutter/material.dart';
import 'package:project4/core/text/app_text.dart';
import 'package:project4/core/text/text_styles.dart';

class TextListTile extends StatelessWidget {
  const TextListTile({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        AppText.digitCode,
        textAlign: TextAlign.center,
        style: TextStyles.cairo60014,
      ),
      subtitle: Text(
        subtitle,
        textAlign: TextAlign.center,
        style: TextStyles.cairo60014,
      ),
    );
  }
}
