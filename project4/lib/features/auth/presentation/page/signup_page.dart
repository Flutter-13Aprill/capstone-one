import 'package:flutter/material.dart';
import 'package:project4/core/extension/git_size_screen.dart';
import 'package:project4/core/function/navigaation.dart';
import 'package:project4/core/text/app_text.dart';
import 'package:project4/core/text/text_styles.dart';
import 'package:project4/core/widget/custom_button.dart';
import 'package:project4/core/widget/custom_text_button.dart';
import 'package:project4/core/widget/custom_text_form_field.dart';
import 'package:project4/features/auth/presentation/controller/auth_controller.dart';
import 'package:project4/features/auth/presentation/page/login_page.dart';
import 'package:project4/features/auth/presentation/widget/custom_checkbox.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: authController.formKey2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset("asset/image/fatoortak.png"),
                const SizedBox(height: 58),
                Text(AppText.signUp, style: TextStyles.inter90024),
                const SizedBox(height: 8),
                Text(AppText.createAccount, style: TextStyles.inter40012),
                const SizedBox(height: 58),

                CustomTextFormField(
                  hintText: AppText.hintName,
                  labelText: AppText.name,
                  controller: authController.nameController,
                  validator: authController.nameValidator,
                ),
                const SizedBox(height: 35),
                CustomTextFormField(
                  hintText: AppText.hintPhoneNumber,
                  labelText: AppText.phoneNumber,
                  controller: authController.phoneController,
                  validator: authController.phoneValidator,
                ),

                CustomCheckbox(),
                SizedBox(height: context.getHeight() * 0.05),
                CustomButton(
                  onPressed: () {
                    authController.moveToOtp(context, authController.formKey2);
                  },
                  child: Text(AppText.otp),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppText.haveAccount, style: TextStyles.cairo500),
                    CustomTextButton(
                      onPressed: () {
                        customPush(context, LoginPage());
                      },
                      text: AppText.login,
                    ),
                  ],
                ),

                SizedBox(height: 47),
                Divider(),
                Text(AppText.or, style: TextStyles.cairo40014),
                SizedBox(height: 16),

                //NEED TO CHANGE
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
      ),
    );
  }
}
