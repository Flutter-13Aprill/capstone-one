///Class represent OnboardingContent
class OnboardingContent {
  String lightImageUrl;
  String darkImageUrl;
  String title;
  String subTitle;

  // Constructor to initialize
  OnboardingContent({
    required this.darkImageUrl,
    required this.lightImageUrl,
    required this.title,
    required this.subTitle,
  });
}

// List onboardingContent
final List<OnboardingContent> onboardingContent = [
  OnboardingContent(
    lightImageUrl: 'assets/images/light_onbording1.png',
    darkImageUrl: 'assets/images/dark_onbording1.png',
    title: 'onboardingTitle1',
    subTitle: 'onboardingSubTitle1',
  ),
  OnboardingContent(
    lightImageUrl: 'assets/images/light_onbording2.png',
    darkImageUrl: 'assets/images/dark_onbording2.png',
    title: 'onboardingTitle2',
    subTitle: 'onboardingSubTitle2',
  ),
  OnboardingContent(
    lightImageUrl: 'assets/images/light_onbording3.png',
    darkImageUrl: 'assets/images/dark_onbording3.png',
    title: 'onboardingTitle3',
    subTitle: 'onboardingSubTitle3',
  ),
];
