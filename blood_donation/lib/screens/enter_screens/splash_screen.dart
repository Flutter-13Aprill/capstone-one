import 'package:blood_donation/screens/enter_screens/determine_user.dart';
import 'package:blood_donation/widgets/enter_widget/background_theem.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DetermineUserScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BackgroundTheem());
  }
}
