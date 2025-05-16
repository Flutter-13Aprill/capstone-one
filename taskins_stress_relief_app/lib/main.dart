import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskins_stress_relief_app/screens/breathing_screen.dart';
import 'package:taskins_stress_relief_app/screens/chat_ai_screen.dart';
import 'package:taskins_stress_relief_app/screens/games_screen.dart';
import 'package:taskins_stress_relief_app/screens/journal_screen.dart';
import 'package:taskins_stress_relief_app/screens/log_in_screen.dart';
import 'package:taskins_stress_relief_app/screens/mood_tracer_screen.dart';
import 'package:taskins_stress_relief_app/screens/new_list_screen.dart';
import 'package:taskins_stress_relief_app/screens/notification_screen.dart';
import 'package:taskins_stress_relief_app/screens/reward_screen.dart';
import 'package:taskins_stress_relief_app/screens/room_screen.dart';
import 'package:taskins_stress_relief_app/screens/setting_screen.dart';
import 'package:taskins_stress_relief_app/screens/sign_up_screen.dart';
import 'package:taskins_stress_relief_app/screens/splash_screen.dart';
import 'package:taskins_stress_relief_app/screens/sub_list_screen.dart';
import 'package:taskins_stress_relief_app/themes/styles/thememode.dart';
import 'package:taskins_stress_relief_app/themes/theme_manager.dart';
import 'package:taskins_stress_relief_app/widgets/nav_bar.dart';
import 'package:taskins_stress_relief_app/widgets/shimmer.dart';

Future<void> clearAppData() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();  // Clear all saved data
  print("App data cleared!");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // Clear all app data on each restart
  await clearAppData();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'AR')],
      path: 'assets/translations',  // Change the path if necessary
      fallbackLocale: Locale('en', 'US'),
   child: ChangeNotifierProvider(
      create: (context) => ThemeManager(),
      child: const MyApp(),
    ),
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    Provider.of<ThemeManager>(context, listen: false).removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    Provider.of<ThemeManager>(context, listen: false).addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeManager.themeMode,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/login': (context) => const LogInScreen(),
        '/home': (context) => NavBar(initialSubtasks: []),
        '/explore': (context) => NavBar(initialIndex: 1, initialSubtasks: []),
        '/shimmer': (context) => const ShimmerScreen(),
        '/breathing': (context) => const BreathingScreen(),
        '/notification': (context) => const NotificationScreen(),
        '/journal': (context) => const JournalScreen(),
        '/games': (context) => const GamesScreen(),
        '/moodtracker': (context) => const MoodTracerScreen(),
        '/awardroom': (context) => const RoomScreen(),
        '/aichatbot': (context) => const ChatAiScreen(),
        '/newlist': (context) => const NewListScreen(),
        '/sublist': (context) => const SubListScreen(subtasks: []),
        '/rewards': (context) => const RewardScreen(),
        '/settings': (context) => const SettingScreen(),
        '/Notifications': (context) => const NotificationScreen(),
      },
    );
  }
}

