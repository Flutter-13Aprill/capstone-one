import 'package:flutter/material.dart';
import 'package:save_your_money_app/screens/login_screen.dart';
import 'package:save_your_money_app/widgets/content_of_onboarding_widget.dart';
import 'package:save_your_money_app/widgets/translation_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:easy_localization/easy_localization.dart';

class StartedScreen extends StatefulWidget {
  const StartedScreen({super.key});

  @override
  State<StartedScreen> createState() => _StartedScreenState();
}
// A stateful screen that displays an onboarding flow for the app.
// It includes a `PageView` for swiping through 3 pages of content with images and descriptions.
// The screen has a "Next" button to navigate through pages or proceed to the main screen when the last page is reached.
// It uses `SmoothPageIndicator` to show page navigation dots and displays custom content widgets (`ContentOfPage`) for each page.

class _StartedScreenState extends State<StartedScreen> {
  final PageController pageController = PageController();
  int currentIndex = 0;
  final List<String> onboardingKeys = [
    "onboarding1",
    "onboarding2",
    "onboarding3",
  ];
  final List<String> onboardingImages = [
    "assets/images/onboarding1-image.png",
    "assets/images/onboarding2-image.png",
    "assets/images/onboarding3-image.png",
  ];

  void onNext() {
    if (currentIndex < onboardingKeys.length - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      onFinish();
    }
  }

  void onFinish() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TranslationWidget(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Positioned(
              top: 120,
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: onboardingKeys.length,
                  effect: ExpandingDotsEffect(
                    dotHeight: 12,
                    dotWidth: 12,
                    expansionFactor: 2,
                    dotColor: Colors.grey,
                    activeDotColor:
                        (Theme.of(context).textTheme.bodyLarge!.color)!,
                  ),
                ),
              ),
            ),
            PageView.builder(
              controller: pageController,
              itemCount: onboardingKeys.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final key = onboardingKeys[index];
                return ContentOfOnboardingWidget(
                  title: '$key.title'.tr(),
                  description: '$key.subtitle'.tr(),
                  imagePath: onboardingImages[index],
                );
              },
            ),
            Positioned(
              left: 150,
              right: 150,
              bottom: 50,
              child: InkWell(
                onTap: () {
                  onNext();
                },
                child: Container(
                  height: 80,
                  width: 90,
                  decoration: BoxDecoration(
                    color: (Theme.of(context).textTheme.bodyLarge!.color)!,
                    shape: BoxShape.circle,
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 35,
                      color: Color(0xff103713),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
