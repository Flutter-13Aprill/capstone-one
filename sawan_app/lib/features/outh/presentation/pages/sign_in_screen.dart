import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization.dart' as signIn;
import 'package:flutter/material.dart';
import 'package:sawan_app/core/function/navigation.dart';
import 'package:sawan_app/core/text/text_style.dart';
import 'package:sawan_app/core/widget/custom_elevated_button.dart';
import 'package:sawan_app/core/widget/custom_navbar.dart';
import 'package:sawan_app/core/widget/custom_text_button.dart';

import 'package:sawan_app/features/outh/presentation/pages/log_in_screen.dart';
import 'package:sawan_app/features/outh/presentation/widget/custom_text_form.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<SignInScreen> {
  final keyForm = GlobalKey<FormState>();
  TextEditingController emaiController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
  String errorMassge = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/Sawan Logo2.png",
                height: 72,
                width: 151.88,
              ),
              SizedBox(height: 30, width: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "signIn".tr(),
                  style: TextStyles.alexandra700size18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "signInSubTitle".tr(),
                  style: TextStyles.alexandra400size14,
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                key: keyForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email".tr(), style: TextStyles.alexandra400size14),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextForm(
                        controller: emaiController,
                        text: "email".tr(),
                      ),
                    ),
                    Text("Passowrd".tr(), style: TextStyles.alexandra400size14),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextForm(
                        controller: passwordController,
                        text: "password".tr(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextForm(
                        controller: password2Controller,
                        text: "password".tr(),
                      ),
                    ),
                    SizedBox(height: 14),
                    Center(
                      child: CustomElvatedButton(
                        height: 40,
                        width: 200,
                        press: () {
                          errorMassge = "";
                          keyForm.currentState!.validate();
                          final email = emaiController.text;
                          final password = passwordController.text;
                          final password2 = password2Controller.text;

                          if (email.isEmpty) {
                            errorMassge +=
                                "البريد الألكتروني لايمكن ان يكون فارغ\n";
                          } else if (!RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
                          ).hasMatch(email)) {
                            errorMassge +=
                                "الأيميل يجب ان يحتوي على @gmail.com\n";
                          }

                          if (password.isEmpty) {
                            errorMassge += "كلمه المرور لايمكن ان تكون فارغه\n";
                          } else {
                            if (password.length <= 6) {
                              errorMassge +=
                                  "كلمه المرور يجب ان تحتوي على اكثر من 6 عناصر\n";
                            }
                            if (!password.contains(RegExp(r'[A-Z]'))) {
                              errorMassge +=
                                  "كلمه المرور يجب ان تحتوي على حرف كبير\n";
                            }
                          }

                          if (password2.isEmpty) {
                            errorMassge += "كلمه المرور لايمكن ان تكون فارغه\n";
                          } else if (password2 != password) {
                            errorMassge += "كلمات المرور غير متطابقه";
                          }

                          setState(() {});
                          if (errorMassge.isEmpty) {
                            customReplacmentNaviagte(context, CustomNavbar());
                          }
                        },
                        child: Text("Sign In".tr()),
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (errorMassge.isNotEmpty)
                      Text(
                        errorMassge,
                        style: const TextStyle(color: Colors.red),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "do you acc".tr(),
                          style: TextStyles.alexandra400size14,
                        ),
                        CustomTextButton(
                          press: () {
                            customReplacmentNaviagte(context, LogInScreen());
                          },
                          child: Text("Sign Up".tr()),
                        ),
                        IconButton(
                          onPressed: () {
                            if (context.locale.languageCode == 'ar') {
                              context.setLocale(Locale('en', 'US'));
                            } else {
                              context.setLocale(Locale('ar', 'AR'));
                            }
                          },

                          icon: Icon(Icons.settings),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
