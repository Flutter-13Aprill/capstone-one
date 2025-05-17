import 'package:flutter/material.dart';
import 'package:jojo_bakery/theme/app_colors.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback? onActionTap;

  const SectionHeader({
    super.key,
    required this.title,
    required this.actionText,
    this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.text,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: onActionTap,
            child: Text(
              actionText,
              style: TextStyle(fontSize: 12, color: AppColors.primary),
            ),
          ),
        ),
      ],
    );
  }
}
