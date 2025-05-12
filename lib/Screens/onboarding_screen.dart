import 'package:capstone1/CustomWidgets/OnboardingScreen/onboarding_view.dart';
import 'package:capstone1/Helpers/screen_extinsion.dart';
import 'package:capstone1/Screens/nav_bar.dart';
import 'package:capstone1/Styling/colors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<Widget> _views = [
    OnboardingView(imagePath: 'assets/images/coins.png'),
    OnboardingView(imagePath: 'assets/images/phone.png'),
  ];
  final List<String> _titles = [
    "Welcome to Expense Manager",
    "Are you ready to take control of your finaces?",
  ];
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.screenHeight,
        width: context.screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: context.screenHeight * 0.15),
            Text(
              textAlign: TextAlign.center,
              _titles[_currentPage],
              style: TextStyle(
                color: darkModeGreen,
                fontWeight: FontWeight.bold,
                fontFamily: "poppins",
                fontSize: 30,
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: context.screenHeight * 0.7,
                width: context.screenWidth,
                decoration: BoxDecoration(
                  color: backgroundGreenwhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(context.screenHeight * 0.06),
                    topRight: Radius.circular(context.screenHeight * 0.06),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: context.screenHeight * 0.05),
                    SizedBox(
                      height: context.screenHeight * 0.43,
                      width: context.screenWidth,
                      child: PageView(
                        controller: _pageController,

                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        children: _views,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (_currentPage == _views.length - 1) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => NavBar()),
                          );
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      child: Text(
                        "Next",
                        style: TextStyle(
                          color: darkModeGreen,
                          fontSize: context.screenHeight * 0.025,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DotsIndicator(
                      dotsCount: _views.length,

                      position: _currentPage.toDouble(),
                      decorator: DotsDecorator(
                        activeColor: mainGreen,
                        color: Colors.white,
                        size: const Size(15, 15),
                        activeSize: const Size(15.0, 15),

                        activeShape: CircleBorder(),

                        shape: CircleBorder(
                          side: BorderSide(color: darkModeGreen, width: 2.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
