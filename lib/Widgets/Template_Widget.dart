import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:app_design_implementation/Controllers/App_Themes.dart';

class TemplateWidget extends StatelessWidget {
  final String imagePath;
  final String title;

  const TemplateWidget({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            width: 100,
            height: 100,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.tr(),
                style: TextStyle(
                  color: isDark ? Colors.white : const Color(0xFF5D3A86),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppThemes.titleGradient.colors.first,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  elevation: 5,
                ),
                child: const Text('download').tr(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
