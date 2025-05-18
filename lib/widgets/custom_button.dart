import 'package:flutter/material.dart';

// -- Extensions
import 'package:shabah/extensions/screen_size.dart';

// -- App Theming
import 'package:shabah/style/app_colors.dart';

class CustomButton extends StatelessWidget {

  /// [CustomButton] A customizable button with a fixed height, full width, rounded corners, and a label.
  ///
  /// The button uses the app's tertiary color as background and triggers [onPressed] callback when tapped.
  const CustomButton({super.key, required this.labelText, this.onPressed});

  final String labelText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: context.getWidth(),
        height: context.getHeight(multiplied: 0.06),
        decoration: BoxDecoration(
          color: AppColors.tertiaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(labelText, style: Theme.of(context).textTheme.labelLarge),
      ),
    );
  }
}
