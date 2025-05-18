import 'package:flutter/material.dart';
import 'package:project_flow/Theme/app_colors.dart';

class ContainerIconWidget extends StatelessWidget {
  const ContainerIconWidget({super.key, required this.iconPath, required this.onTap});

  final String iconPath;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(iconPath)),
          border: Border.all(color: AppColors.textHint, width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
