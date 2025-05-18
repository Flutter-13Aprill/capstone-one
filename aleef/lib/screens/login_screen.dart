import 'package:aleef/controller/login_controller.dart';
import 'package:aleef/screens/signup_screen.dart';
import 'package:aleef/widget/buttom_widget.dart';
import 'package:aleef/widget/language_button.dart';
import 'package:aleef/widget/login_signup_widget.dart';
import 'package:aleef/widget/text_field_widget.dart';
import 'package:aleef/widget/title_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Login screen with form validation and navigation to sign-up screen.
class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});
  final _keyForm = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginController validateController = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(padding: const EdgeInsets.all(8.0), child: LanguageButton()),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Form(
              key: _keyForm,
              child: Builder(
                builder: (context) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 16,
                    children: [
                      // Login Title, aligned by locale direction
                      TitleWidget(textTitle: 'logInTitle'.tr()),

                      // Email TextField with validation
                      TextFieldWidget(
                        labelText: 'email'.tr(),
                        controller: emailController,
                        textHint: 'emailHint'.tr(),
                        validate: (value) {
                          return validateController.validateEmpty(
                            value,
                            "emailRequired".tr(),
                          );
                        },
                      ),
                      // Password TextField with validation
                      TextFieldWidget(
                        labelText: 'password'.tr(),
                        controller: passwordController,
                        textHint: 'passwordHint'.tr(),
                        validate: (value) {
                          return validateController.validateEmpty(
                            value,
                            "passwordRequired".tr(),
                          );
                        },
                      ),
                      // Submit Button
                      ButtomWidget(
                        onTab: () {
                          validateController.onSubmit(context, _keyForm);
                        },
                        textElevatedButton: 'continue'.tr(),
                      ),
                      // Navigate to Signup Screen
                      LogInSignUpWidget(
                        textQuestion: 'dont\'nHave'.tr(),
                        textButtom: 'signup'.tr(),
                        onTab: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
