import 'package:capstone/extensions/size.dart';
import 'package:capstone/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  //Splash Screen for the app stays for 3 seconds

  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),(){

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> OnboardingScreen()));

    });
    return Scaffold(
      body: Center(
        child: Container(height: context.getHieght()*0.25,
          child: Stack(
          
          
            children: [
          
          
              Container(alignment: Alignment.center,width: context.getWidth(),child: Image.asset('assets/images/eye.png',alignment: Alignment.center,)),
              Container(alignment: Alignment.bottomCenter,child: Text(textAlign: TextAlign.center,'Brainies',style: TextStyle(fontSize: 35,),))
            ],
          ),
        ),
      ),
    );
  }
}
