import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
class LanguageController with ChangeNotifier {
  void toggleLanguage(BuildContext context) {
    final currentLocale = context.locale;
    if (currentLocale.languageCode == 'en') {
      context.setLocale(const Locale('ar'));
    } else {
      context.setLocale(const Locale('en'));
    }
    notifyListeners();
  }
}
