import 'package:flutter/material.dart';
import 'package:project_flow/mainApp.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async{
 WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
   runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations', 
      fallbackLocale: Locale('en', 'US'),
      child: MainApp()
    ),
  );
}

