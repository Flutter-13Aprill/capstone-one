import 'package:coffee/screens/onboarding_screen.dart';
import 'package:coffee/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 9),(){
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const OnBoardingScreen()
        ));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, 
    overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      backgroundColor: AppColors.darkGray, // WILL changes when add style colors
      body:  Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 24,
                children:  [
                  SvgPicture.asset('assets/images/logo.svg',width: 250,colorFilter: ColorFilter.mode(const Color.fromARGB(83, 255, 255, 255), BlendMode.srcIn),),
                  Text(
                    'C O F F E E N O',
                    style: TextStyle(
                      fontSize: 48,
                      color: const Color.fromARGB(83, 255, 255, 255),
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                ],
              ),
            ),
          // ),
    );
  }
}