import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sawan_app/core/theme/app_theme.dart';

import 'package:sawan_app/features/onbording/presentation/pages/onbording_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('ar', 'AR'), Locale('en', 'US')],
      path:
          'assets/translition', // <-- change the path of the translation files
      fallbackLocale: Locale('ar', 'AR'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      // supportedLocales: [Locale('ar', "AR")],
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: OnbordingScreen(),
    );
  }
}
