import 'package:flutter/material.dart';
import 'package:jojo_bakery/theme/app_colors.dart';

class CircularImageIcon extends StatelessWidget {
  final String imagePath;
  final bool hasBorder;
  final String label;

  const CircularImageIcon({
    super.key,
    required this.imagePath,
    this.hasBorder = false,
    this.label = '',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: AppColors.cardColors,
                  borderRadius: BorderRadius.circular(60),
                  border:
                      hasBorder
                          ? Border.all(color: AppColors.primary, width: 2)
                          : null,
                ),
              ),
              Positioned(
                top: 10,
                child: Image.asset(imagePath, height: 50, width: 50),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: AppColors.text,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
