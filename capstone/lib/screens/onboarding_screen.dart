import 'package:capstone/extensions/size.dart';
import 'package:capstone/screens/login_screen.dart';
import 'package:capstone/widgets/containers/page_view_onboarding.dart';
import 'package:capstone/widgets/onboarding_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

//simple onboarding screen shows 3 pages explains the app

PageController pageController = PageController();
int curretPage = 0;

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              if (context.locale.languageCode == "ar") {
                context.setLocale(Locale('en', 'US'));
              } else {
                context.setLocale(Locale('ar', 'AR'));
              }
            },
            icon: Icon(Icons.language,color: Colors.white,),
          ),
        ],
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: context.getWidth(),
          height: context.getHieght(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100),

              Container(
                width: context.getWidth(),
                height: context.getHieght() * 0.5,
                child: PageView(
                  controller: pageController,
                  onPageChanged: (value) {
                    curretPage = value;
                    setState(() {});
                  },

                  children: [
                    PageViewOnboarding(
                      setImage: 'assets/images/sleep_eye.png',
                      setText: 'onBoarding1'.tr(),
                    ),
                    PageViewOnboarding(
                      setImage: 'assets/images/damaged_eye.png',
                      setText: 'onBoarding2'.tr(),
                    ),
                    PageViewOnboarding(
                      setImage: 'assets/images/cry_eye.png',
                      setText: 'onBoarding3'.tr(),
                    ),
                  ],
                ),
              ),
              OnboardingIndicator(curretPage: curretPage),
              SizedBox(height: 100),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 172, 173, 173),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  color: Colors.black,
                  onPressed: () {
                    if (curretPage == 2) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    }
                    pageController.nextPage(
                      duration: Duration(milliseconds: 350),
                      curve: Curves.easeIn,
                    );
                  },
                  icon: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
