import 'package:app/screen/bottom_navigation_bar_screen.dart';
import 'package:app/screen/choose_language.dart';
import 'package:app/screen/flight_result_screen.dart';
import 'package:app/screen/flight_search_screen.dart';
import 'package:app/screen/home_screen.dart';
import 'package:app/screen/login_screen.dart';
import 'package:app/screen/onbording_screen.dart';
import 'package:app/screen/one_way_screen.dart';
import 'package:app/screen/page_view_screen.dart.dart';
import 'package:app/screen/profile_screen.dart';
import 'package:app/screen/reservations_screen.dart.dart';
 import 'package:app/screen/sign_up_screen.dart';
import 'package:app/screen/splash_screen.dart';
import 'package:app/screen/widgets/date_picker/date_picker_widget.dart';
import 'package:app/theme/custom_theme.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

bool isDarkThem = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'AR')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en', 'US'),
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

      debugShowCheckedModeBanner: false,
      theme: CustomTheme.defalutTheme,
      darkTheme: CustomTheme.darkTheme,
      home: BottomNavigationBarScreen(),
    );
  }
}
