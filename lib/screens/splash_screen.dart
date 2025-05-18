import 'package:flutter/material.dart';
import 'package:spotify_redesign/screens/login.dart';

// "SplashScreen" where the logo is displayed for a couple of seconds then navigate to the "OnBoarding" screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            child: Image.asset("assets/icons/Spotify_Logo_RGB_Green.png"),
          ),
        ),
      ),
    );
  }
}
