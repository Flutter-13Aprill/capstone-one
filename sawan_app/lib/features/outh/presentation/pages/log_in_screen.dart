import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sawan_app/core/function/navigation.dart';
import 'package:sawan_app/core/text/app_text.dart';
import 'package:sawan_app/core/text/text_style.dart';
import 'package:sawan_app/core/widget/custom_elevated_button.dart';
import 'package:sawan_app/core/widget/custom_navbar.dart';
import 'package:sawan_app/core/widget/custom_text_button.dart';
import 'package:sawan_app/features/outh/presentation/pages/sign_in_screen.dart';
import 'package:sawan_app/features/outh/presentation/widget/custom_text_form.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final keyForm = GlobalKey<FormState>();
  TextEditingController emaiController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppText.signIn,
                  style: TextStyles.alexandra700size18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppText.signInSubTitle,
                  style: TextStyles.alexandra400size14,
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                key: keyForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("email".tr(), style: TextStyles.alexandra400size14),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextForm(
                        controller: emaiController,
                        text: AppText.email,
                      ),
                    ),
                    Text("Passowrd".tr(), style: TextStyles.alexandra400size14),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextForm(
                        controller: passwordController,
                        text: AppText.password,
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

                          setState(() {});

                          if (errorMassge.isEmpty) {
                            customReplacmentNaviagte(context, CustomNavbar());
                          }
                        },
                        child: const Text("دخول"),
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
                          "no_account".tr(),
                          style: TextStyles.alexandra400size14,
                        ),
                        CustomTextButton(
                          press: () {
                            customReplacmentNaviagte(context, SignInScreen());
                          },
                          child: Text("create_account".tr()),
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
