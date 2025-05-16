import 'package:app/extension/Screen/get_size_screen.dart';
import 'package:app/main.dart';
import 'package:app/screen/bottom_navigation_bar_screen.dart';
import 'package:app/screen/sign_up_screen.dart';
import 'package:app/screen/widgets/button/button.dart';
import 'package:app/screen/widgets/text_form_field/text_form_field_register.dart';
import 'package:app/theme/style_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>(); // Key to manage the form state.
  final emailControllar =
      TextEditingController(); // Controller for email input.
  final passwordControllar =
      TextEditingController(); // Controller for password input.

  void _submitForm() {
    // Controller for password input.
    if (_formKey.currentState!.validate()) {
      String email = emailControllar.text; // Controller for password input.
      String password =
          passwordControllar.text; // Controller for password input.
      //print('Email: $email, Password: $password');

      // Navigate to the bottom navigation bar screen, replacing the current screen.

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigationBarScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Focus.of(context).unfocus();; // Optional: Unfocus keyboard on tap outside.
      },
      child: Scaffold(
        appBar: AppBar(),// Basic app bar.
        body: SingleChildScrollView(          // Allows scrolling if content overflows.
          child: Column( // Align children to the left.
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),// Vertical spacing.
              Padding(
                padding: const EdgeInsets.only(left: 16.0), // Left padding.
                child: Text(
                  "join".tr(), // Localized text for "join".
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge!.copyWith(fontSize: 24), // Large label text style.
                ),
              ),
              SizedBox(height: 20),// Vertical spacing.
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,// Align children to the left.
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),// Padding around the text.
                      child: Text(
                        "${"email".tr()}\t\t\t\t",// Padding around the text.
                        style: Theme.of(context).textTheme.headlineLarge,// Large headline text style
                      ),
                    ),
                    TextFormFieldRegister(
                      controller: emailControllar, // Assign the email controller.
                      lable: "email",// Label for the email field.
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0), // Padding around the text.
                      child: Text(
                        "password".tr(),
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    TextFormFieldRegister(
                      obscureText: true,//to make password obscureText
                      controller: passwordControllar, // Assign the email controller.

                      lable: "password",// Label for the email field.
                    ),
                    Center(
                      child: Button(//button  with title and on press
                        title: "login",
                        onPressed: () {
                          _submitForm();//go _submitForm
                        },
                      ),
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "dont_have_account".tr(),

                          style://style depend on isDarkThem
                              !isDarkThem
                                  ? Theme.of(context).textTheme.headlineLarge
                                  : Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(width: 4),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,                              // Navigate to the sign up screen.
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "sign_up".tr(),// Localized "sign up" text.
                            style: Theme.of(context).textTheme.headlineLarge
                                ?.copyWith(fontWeight: FontWeight.bold),// Bold text.
                          ),
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
