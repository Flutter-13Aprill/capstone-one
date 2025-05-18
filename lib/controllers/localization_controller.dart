import 'package:flutter/widgets.dart';

// -- External Package
import 'package:easy_localization/easy_localization.dart';
class LocalizationController {

  static Alignment setAlignment({required BuildContext context}){
    return context.locale.languageCode == 'en' ? Alignment.centerLeft : Alignment.centerRight;
  }
}