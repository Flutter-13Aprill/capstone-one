import 'package:flutter/material.dart';
import 'package:spotify_redesign/screens/login.dart';
import 'package:spotify_redesign/screens/onboarding_pages/onboarding_page_1.dart';
import 'package:spotify_redesign/screens/onboarding_pages/onboarding_page_2.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageViewController =
      PageController(); // initalizing the "pageViewController"
  int pageNum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      
      body: Stack(children: [
        PageView( // Creating the PageView
          controller: pageViewController,
          children: const [ //List of the pages for the  "onBoarding_screen" PageView
            OnboardingPage1(),
            OnboardingPage2()
          ], 
        ),
        Padding(
          padding:  EdgeInsets.only(bottom: 32),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: InkWell( // The button to procced with the onBoarding and navigating to "login_screen"
              onTap: () {
                pageNum == 1
                    ? Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()))
                    : pageViewController.animateToPage(pageNum += 1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
              },
              child: Container(
                width: 70,
                height: 70,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(15)),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
