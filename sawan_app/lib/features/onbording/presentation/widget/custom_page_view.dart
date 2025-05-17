import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sawan_app/core/function/navigation.dart';
import 'package:sawan_app/core/text/text_style.dart';
import 'package:sawan_app/core/widget/custom_elevated_button.dart';

import 'package:sawan_app/features/onbording/data/onbording_model.dart';
import 'package:sawan_app/features/onbording/presentation/widget/cusom_smooth_indecator.dart';
import 'package:sawan_app/features/onbording/presentation/widget/onbording_controller.dart';
import 'package:sawan_app/features/outh/presentation/pages/sign_in_screen.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView({super.key});

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  OnbordingController onborderController = OnbordingController();

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: onborderController.controller,
      itemCount: onbordingData.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 10, width: 200),
              Image.asset(onbordingData[index].image),
              SizedBox(height: 5, width: 20),
              Text(
                onbordingData[index].title.tr(),
                style: TextStyles.alexandra700.copyWith(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10, width: 20),

              Text(
                onbordingData[index].subTitle.tr(),
                style: TextStyles.alexandra400,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40, width: 40),
              CustomSmoothIndecator(controller: onborderController.controller),
              SizedBox(height: 70, width: 70),
              Row(
                children: [
                  SizedBox(
                    child: TextButton(
                      onPressed: () {
                        customReplacmentNaviagte(context, SignInScreen());
                      },
                      child: Text("تخطي", style: TextStyles.alexandra400),
                    ),
                  ),
                  SizedBox(height: 0, width: 230),
                  SizedBox(
                    child: CustomElvatedButton(
                      press: () {
                        onborderController.cheeckNavigation(context, index);
                      },
                      child: Icon(Icons.arrow_forward),
                      height: 40,
                      width: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
