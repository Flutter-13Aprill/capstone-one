import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project4/core/extension/git_size_screen.dart';
import 'package:project4/core/function/navigaation.dart';
import 'package:project4/core/text/text_styles.dart';
import 'package:project4/core/widget/custom_button.dart';
import 'package:project4/core/widget/custom_text_button.dart';
import 'package:project4/features/auth/presentation/page/login_page.dart';
import 'package:project4/features/onboarding/data/model/onboarding_model.dart';
import 'package:project4/features/onboarding/presentation/controller/onboarding_controller.dart';
import 'package:project4/features/onboarding/presentation/widget/custom_smooth_page.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({super.key});
  final OnboardingController onboardingController = OnboardingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: onboardingController.pageController,
        itemCount: onboardingData.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(24),
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: CustomTextButton(
                      onPressed: () {
                        customPushReplacement(context, LoginPage());
                      },
                      text: "skip".tr(),
                    ),
                  ),
                  SizedBox(height: 23),
                  SizedBox(
                    width: context.getWidth() * 0.90,
                    child: Image.asset(
                      onboardingData[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 23),
                  Text(onboardingData[index].title, style: TextStyles.cairo900),
                  SizedBox(height: 24),
                  Text(
                    onboardingData[index].description,
                    style: TextStyles.cairo40016,
                  ),
                  SizedBox(height: context.getHeight() * 0.10),
                  CustomSmoothPage(
                    controller: onboardingController.pageController,
                  ),
                  SizedBox(height: 60),
                  // const Spacer(),
                  CustomButton(
                    onPressed: () {
                      onboardingController.navigatorPage(context, index);
                    },

                    child: Text(
                      onboardingController.isLastPage(index)
                          ? "start".tr()
                          : "next".tr(),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}