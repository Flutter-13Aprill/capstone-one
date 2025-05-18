import 'package:aleef/controller/singup_controller.dart';
import 'package:aleef/main.dart';
import 'package:aleef/widget/buttom_widget.dart';
import 'package:aleef/widget/language_button.dart';
import 'package:aleef/widget/login_signup_widget.dart';
import 'package:aleef/widget/text_field_widget.dart';
import 'package:aleef/widget/title_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Sign-up screen with form validation and navigation to login.
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final _keyForm = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController conpasswordController = TextEditingController();
  final SingupController validateController = SingupController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                      // Signup Title
                      TitleWidget(textTitle: 'signUpTitle'.tr()),
                      // Name TextField with validation
                      TextFieldWidget(
                        labelText: 'name'.tr(),
                        controller: userNameController,
                        textHint: 'nameHint'.tr(),
                        validate: (value) {
                          return validateController.validateUsername(value);
                        },
                      ),
                      // Email TextField with validation
                      TextFieldWidget(
                        labelText: 'email'.tr(),
                        controller: emailController,
                        textHint: 'emailHint'.tr(),
                        validate: (value) {
                          return validateController.validateEmail(value);
                        },
                      ),
                      // Password TextField with validation
                      TextFieldWidget(
                        labelText: 'password'.tr(),
                        controller: passwordController,
                        textHint: 'passwordHint'.tr(),
                        validate: (value) {
                          return validateController.validatePassword(value);
                        },
                      ),
                      // Conform Password TextField with validation
                      TextFieldWidget(
                        labelText: 'conformPassword'.tr(),
                        controller: conpasswordController,
                        textHint: 'conformPasswordHint'.tr(),
                        validate: (value) {
                          return validateController.validateConfirmPassword(
                            passwordController,
                            conpasswordController,
                            value,
                          );
                        },
                      ),

                      // Submit Button
                      ButtomWidget(
                        onTab: () {
                          prefs.setString('name', userNameController.text);
                          prefs.setString('email', emailController.text);
                          validateController.onSubmit(context, _keyForm);
                        },
                        textElevatedButton: 'continue'.tr(),
                      ),
                      // Navigate to Login Screen
                      LogInSignUpWidget(
                        textQuestion: 'haveAccount'.tr(),
                        textButtom: 'login'.tr(),
                        onTab: () {
                          Navigator.pop(context);
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
