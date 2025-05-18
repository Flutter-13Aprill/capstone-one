import 'package:easy_localization/easy_localization.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String description;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnboardingModel> onboardingData = [
  OnboardingModel(
    image: "asset/image/onboarding1.png",
    title: "onboardingTitle1".tr(),
    description: "onboardingSubTitle1".tr(),
  ),
  OnboardingModel(
    image: "asset/image/onboarding2.png",
    title: "onboardingTitle2".tr(),
    description: "onboardingSubTitle2".tr(),
  ),
  OnboardingModel(
    image: "asset/image/onboarding3.png",
    title: "onboardingTitle3".tr(),
    description: "onboardingSubTitle3".tr(),
  ),
];
