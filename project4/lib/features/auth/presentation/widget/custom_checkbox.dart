import 'package:flutter/material.dart';
import 'package:project4/core/text/app_text.dart';
import 'package:project4/core/text/text_styles.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({super.key});

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: (value) {
            setState(() {
              _isChecked = value!;
            });
          },
        ),
        RichText(
          text: TextSpan(
            style: TextStyles.cairo40016,

            children: [TextSpan(text: (AppText.readAndAgree))],
          ),
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),

        // CustomTextButton(onPressed: () {}, text: AppText.termsAndConditions),
        // Text(AppText.andThe),
        // CustomTextButton(onPressed: () {}, text: AppText.privacyPolicy),
      ],
    );
  }
}
