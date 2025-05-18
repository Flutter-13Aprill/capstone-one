import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:save_your_money_app/controllers/signup_controller.dart';
import 'package:save_your_money_app/screens/bottom_navbar.dart';
import 'package:save_your_money_app/screens/login_screen.dart';
import 'package:save_your_money_app/utils/extensions/screen/screen_size.dart';
import 'package:save_your_money_app/widgets/custom_rich_text_widget.dart';
import 'package:save_your_money_app/widgets/custom_text_field%20.dart';
import 'package:save_your_money_app/widgets/translation_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}
// Signup screen with form validation using SignupController,
// custom text fields with password visibility toggle,
// localization support, and navigation to login or main app screen.

class _SignupScreenState extends State<SignupScreen> {
  final _keyForm = GlobalKey<FormState>();
  SignupController controller = SignupController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TranslationWidget(),

      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/login.png",
                  height: context.getHeight(0.28),
                ),

                // SizedBox(height: 32),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'sign_up'.tr(),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                  ),
                ),
                SizedBox(height: 16),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Icon(
                        Icons.credit_card,
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'one_step_closer'.tr(),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),

                Form(
                  key: _keyForm,
                  child: Expanded(
                    child: ListView(
                      children: [
                        CustomTextField(
                          controller: controller.usernameController,
                          labelText: 'username'.tr(),
                          prefixIcon: Icons.person_outline,
                          validator: controller.validateUsername,
                        ),

                        SizedBox(height: 16),

                        CustomTextField(
                          controller: controller.emailController,
                          labelText: 'email'.tr(),
                          prefixIcon: Icons.email_outlined,
                          validator: controller.validateEmail,
                        ),

                        SizedBox(height: 16),
                        CustomTextField(
                          controller: controller.passController,
                          labelText: 'password'.tr(),
                          prefixIcon: Icons.password,
                          validator: controller.validatePassword,
                          obscureText: !controller.isClickedPass,
                          suffixIcon:
                              controller.isClickedPass
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                          onSuffixIconPressed: () {
                            setState(() {
                              controller.isClickedPass =
                                  !controller.isClickedPass;
                            });
                          },
                        ),

                        SizedBox(height: 16),

                        CustomTextField(
                          controller: controller.confirmPassController,
                          labelText: 'confirm_password'.tr(),
                          prefixIcon: Icons.password,
                          validator: controller.validateConfirmPassword,
                          obscureText: !controller.isClickedConfirmPass,
                          suffixIcon:
                              controller.isClickedConfirmPass
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                          onSuffixIconPressed: () {
                            setState(() {
                              controller.isClickedConfirmPass =
                                  !controller.isClickedConfirmPass;
                            });
                          },
                        ),

                        SizedBox(height: 32),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Theme.of(context).primaryColor,
                            ),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            minimumSize: WidgetStatePropertyAll(Size(250, 50)),
                          ),
                          onPressed: () {
                            if (controller.validateForm(_keyForm)) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => BottomNavbarScreen(),
                                ),
                              );
                            } else {
                              showSnackBar('please_fix_errors'.tr());
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'sign_up'.tr(),
                              style: Theme.of(
                                context,
                              ).textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),

                        CustomRichTextWidget(
                          normalText: 'already_have_account'.tr(),
                          linkText: 'login'.tr(),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                        ),

                        SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showSnackBar(String message) {
    final snackBar = SnackBar(
      backgroundColor: Colors.red,
      showCloseIcon: false,

      content: Align(
        alignment: Alignment.center,
        child: Text(
          message,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
