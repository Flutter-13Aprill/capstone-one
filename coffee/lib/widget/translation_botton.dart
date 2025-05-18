import 'package:coffee/style/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TranslationBotton extends StatelessWidget {
  const TranslationBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (context.locale.languageCode == 'ar') {
          context.setLocale(Locale('en', 'US'));
        } else {
          context.setLocale(Locale('ar', 'AR'));
        }
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: AppColors.brown,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Icon(Icons.language, color: AppColors.white, size: 50),
      ),
    );
  }
}
