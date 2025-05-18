import 'package:flutter/material.dart';
import 'package:project4/core/extension/git_size_screen.dart';
import 'package:project4/core/function/navigaation.dart';
import 'package:project4/core/text/app_text.dart';
import 'package:project4/core/text/text_styles.dart';
import 'package:project4/core/widget/bottom_nav_bar.dart';
import 'package:project4/core/widget/custom_button.dart';
import 'package:project4/core/widget/custom_text_button.dart';
import 'package:project4/features/auth/presentation/widget/custom_pinput.dart';
import 'package:project4/features/auth/presentation/widget/text_list_tile.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("asset/image/otp.png"),
            SizedBox(height: 39),
            Text(AppText.enterCode, style: TextStyles.cairo900),
            TextListTile(
              title: AppText.digitCode,
              subtitle: "+966${controller.text}",
            ),
            SizedBox(height: 40),

            CustomPinput(),
            SizedBox(height: context.getHeight() * 0.15),

            CustomButton(
              onPressed: () {
                customPush(context, BottomNavBar());
              },
              child: Text(AppText.continues),
            ),
            CustomTextButton(
              onPressed: () {
                // customPush(context, SignupPage());
              },
              text: AppText.resendCode,
            ),
          ],
        ),
      ),
    );
  }
}
