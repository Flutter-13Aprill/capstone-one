import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// -- Screens (For navigate)
import 'package:shabah/widgets/onboarding_screen/navigate_button.dart';

// -- Widgets 
import 'package:shabah/widgets/onboarding_screen/onboarding_page_indicator.dart';
import 'package:shabah/widgets/onboarding_screen/onboarding_page_view.dart';

// -- Extensions 
import 'package:shabah/extensions/screen_size.dart';

// -- External Package 
import 'package:flutter_svg/flutter_svg.dart';


class OnboardingScreen extends StatefulWidget {

  /// [OnboardingScreen] A screen that introduces the app to first-time users.
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  
  late final PageController _pageViewController;
  int currentIndexPage = 0;

  @override
  void initState() {
    _pageViewController = PageController(
      initialPage: 0
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.getWidth(),
        height: context.getHeight(),
        child: Column(
          children: [
            
            SvgPicture.asset('assets/onboarding_screen/onboarding_screen_svgs/Logo.svg'),
        
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [

                  Container(
                    width: context.getWidth(),
                    height: context.getHeight(multiplied: 0.142),
                    margin: EdgeInsets.only(top: context.getHeight(multiplied: 0.06)),
                    child: PageView(
                      controller: _pageViewController,
                      onPageChanged: (value) {
                        setState(() {
                          currentIndexPage = value;
                        });
                      },
                      children: [
                  
                        OnboardingPageView(title: context.tr('first_onboarding_screen_title'), deception: context.tr('first_onboarding_screen_subtitle')),
                  
                        OnboardingPageView(title: context.tr('second_onboarding_screen_title'), deception: tr('second_onboarding_screen_subtitle')),
                  
                        OnboardingPageView(title: context.tr('third_onboarding_screen_title'), deception: context.tr('third_onboarding_screen_subtitle'))
                      ],
                    ),
                  ),

                  SizedBox(height: context.getWidth(multiplied: 0.07),),

                  OnboardingPageIndicator(pageViewIndex: currentIndexPage),

                  SizedBox(height: context.getWidth(multiplied: 0.14),),

                  Align(
                    alignment: context.locale.languageCode == 'en' ? Alignment.centerRight : Alignment.centerLeft ,
                    child: NavigateButton(
                      imagePath: context.locale.languageCode == 'en' ? 'assets/onboarding_screen/onboarding_screen_images/arrow.png' : 'assets/onboarding_screen/onboarding_screen_images/left.png', 
                      currentIndexPage: currentIndexPage, 
                      pageController: _pageViewController
                      )
                    ),
                  
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}