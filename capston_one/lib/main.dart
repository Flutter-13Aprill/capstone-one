import 'package:flutter/material.dart';
import 'package:capston_one/theme/theme.dart'; 
import 'package:capston_one/screens/splash_screen.dart'; 
import 'package:capston_one/repository/local_storage.dart'; 
import 'package:easy_localization/easy_localization.dart';


//EasyLocalization Library: Supports multiple language localization for the application.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();  
  await EasyLocalization.ensureInitialized();
  await LocalStorage.init();  

//The path for the translation files.
//Fallback Language: If the required language is not found, it falls back to the default language (en).
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'AR')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'), 
      child: const MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.defaultTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const SplashScreen(),
    );
  }
}
