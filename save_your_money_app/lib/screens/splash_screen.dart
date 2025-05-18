import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:save_your_money_app/screens/started_screen.dart';
import 'package:save_your_money_app/utils/extensions/screen/screen_size.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
// The splash screen displays the logo for 10 seconds, then transitions to the onboarding screen.

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 10), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => StartedScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Image.asset(
          "assets/images/mooney.png",
          height: context.getHeight(0.7),
          width: context.getWidth(0.9),
        ),
      ),
    );
  }
}
