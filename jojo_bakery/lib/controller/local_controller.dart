import 'package:flutter/widgets.dart';
import 'package:easy_localization/easy_localization.dart';

class LocalizationController {
  String currentLang = 'ar';

  void toggleLang(BuildContext context) {
    if (context.locale.languageCode == 'ar') {
      context.setLocale(const Locale('en', 'US'));
    } else {
      context.setLocale(const Locale('ar', 'SA'));
    }
  }
}
