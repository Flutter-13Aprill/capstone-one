
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// -- Screens
import 'package:shabah/screens/onboarding_screen.dart';

// -- Controllers
import 'package:shabah/controllers/address_controller.dart';
import 'package:shabah/controllers/cart_controller.dart';
import 'package:shabah/controllers/date_picker.dart';
import 'package:shabah/controllers/profile_controller.dart';

// -- External Packages
import 'package:easy_localization/easy_localization.dart';

// App Theme
import 'package:shabah/style/app_theming.dart';

// -- Controllers 
ProfileController profile = ProfileController(userName: '', phoneNumber: '');
CartController? cart;
AddressController? addressController;
DatePicker date = DatePicker();
void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations', // <-- change the path of the translation files 
      fallbackLocale: Locale('en'),
      child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheming.appTheming,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: OnboardingScreen(),
    );
  }
}