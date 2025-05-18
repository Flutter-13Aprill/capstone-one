import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jojo_bakery/controller/local_controller.dart';
import 'package:jojo_bakery/screens/splash_screen.dart';
import 'package:jojo_bakery/theme/app_them.dart';
import 'dart:ui' as ui;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'SA')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('ar', 'SA'),
      startLocale: Locale('ar', 'SA'),
      child: MyApp(),
    ),
  );
}

final loclaiztionController = LocalizationController();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Directionality(
          textDirection:
              context.locale.languageCode == 'ar'
                  ? ui.TextDirection.rtl
                  : ui.TextDirection.ltr,
          child: child!,
        );
      },
      theme: AppThem.lightTheme,

      home: SplashScreen(),
    );
  }
}
