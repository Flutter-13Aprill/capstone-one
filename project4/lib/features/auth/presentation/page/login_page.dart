import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project4/core/extension/git_size_screen.dart';
import 'package:project4/core/function/navigaation.dart';
import 'package:project4/core/text/app_text.dart';
import 'package:project4/core/text/text_styles.dart';
import 'package:project4/core/widget/custom_button.dart';
import 'package:project4/core/widget/custom_text_button.dart';
import 'package:project4/core/widget/custom_text_form_field.dart';
import 'package:project4/features/auth/presentation/controller/auth_controller.dart';
import 'package:project4/features/auth/presentation/page/signup_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final authController = AuthController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: authController.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
          child: Column(
            children: [
              Image.asset("asset/image/fatoortak.png"),
              const SizedBox(height: 58),
              Text("welcome".tr(), style: TextStyles.cairo900),
              const SizedBox(height: 85),

              CustomTextFormField(
                hintText: AppText.hintPhoneNumber,
                labelText: AppText.phoneNumber,
                controller: authController.phoneController,
                keyboardType: TextInputType.phone,
                validator: authController.phoneValidator,
              ),

              SizedBox(height: context.getHeight() * 0.05),
              CustomButton(
                onPressed: () {
                  authController.moveToOtp(context, authController.formKey);
                },
                child: Text(AppText.otp),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppText.member, style: TextStyles.cairo500),
                  CustomTextButton(
                    onPressed: () {
                      customPush(context, SignupPage());
                    },
                    text: AppText.register,
                  ),
                ],
              ),
              SizedBox(height: 47),
              Divider(),
              Text(AppText.or, style: TextStyles.cairo40014),
              SizedBox(height: 16),

              //*********Need To change***********************
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Image.asset("asset/image/google (2).png"),
                  SizedBox(width: 20),
                  Image.asset("asset/image/apple.png"),
                  SizedBox(width: 20),
                  Image.asset("asset/image/facebook (2).png"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
