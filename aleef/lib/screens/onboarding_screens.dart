import 'package:aleef/extensions/screens/get_size_screen.dart';
import 'package:aleef/model/onboarding_content.dart';
import 'package:aleef/screens/login_screen.dart';
import 'package:aleef/style/style_size.dart';
import 'package:aleef/style/style_color.dart';
import 'package:aleef/widget/buttom_widget.dart';
import 'package:aleef/widget/language_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// Onboarding screen that walks users through app features.
class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  final pageController = PageController(); // Controller for pages
  int pageNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(padding: const EdgeInsets.all(8.0), child: LanguageButton()),
        ],
      ),
      // PageView to navigate through the onboarding pages
      body: SafeArea(
        child: PageView.builder(
          controller: pageController,
          itemCount: onboardingContent.length,
          onPageChanged: (index) {
            setState(() {
              pageNumber = index;
            });
          },
          itemBuilder:
              // Building the page view
              (context, index) => Builder(
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Onboarding image
                        Image.asset(
                          Theme.of(context).brightness == Brightness.light
                              ? onboardingContent[index].lightImageUrl
                              : onboardingContent[index].darkImageUrl,
                          width: context.getWidth() + 150,
                          height: context.getHeight() / 3,
                          fit: BoxFit.contain,
                        ),
                        // Onboarding title
                        Text(
                          onboardingContent[index].title.tr(),
                          style: Theme.of(context).textTheme.headlineLarge,
                          textAlign: TextAlign.center,
                        ),
                        // Onboarding subtitle
                        Text(
                          onboardingContent[index].subTitle.tr(),
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                        StyleSize.sizeH48,
                        // Page indicator
                        SmoothPageIndicator(
                          controller: pageController,
                          count: onboardingContent.length,
                          effect: ExpandingDotsEffect(
                            activeDotColor: StyleColor.clay,
                            dotHeight: 6,
                            dotWidth: 6,
                          ),
                        ),
                        StyleSize.sizeH40,
                        // Continue Button
                        ButtomWidget(
                          textElevatedButton: 'continue'.tr(),
                          onTab: () {
                            if (pageNumber < onboardingContent.length - 1) {
                              pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                            } else {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LogInScreen(),
                                ),
                              );
                              setState(() {});
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
        ),
      ),
    );
  }
}
