import 'package:capstone1/Controllers/sign_up_controller.dart';
import 'package:capstone1/CustomWidgets/AuthScreens/email_field.dart';
import 'package:capstone1/CustomWidgets/AuthScreens/password_field.dart';
import 'package:capstone1/CustomWidgets/white_container.dart';
import 'package:capstone1/Helpers/screen_extinsion.dart';
import 'package:capstone1/Styling/colors.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpController signUpController = SignUpController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Text(
                textAlign: TextAlign.center,
                "Create Account",
                style: TextStyle(
                  color: darkModeGreen,
                  fontWeight: FontWeight.bold,
                  fontFamily: "poppins",
                  fontSize: 30,
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: WhiteContainer(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Form(
                      key: _key,
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          EmailField(
                            emailController: signUpController.emailController,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          PasswordField(
                            label: "Password",
                            passwordController:
                                signUpController.passwordController,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          PasswordField(
                            label: "Confirm Password",
                            passwordController:
                                signUpController.confirmPasswordController,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Text(
                            "By signing up, you agree to our Terms of Service and Privacy Policy",
                            style: TextStyle(
                              color: darkModeGreen,
                              fontSize: 12,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              signUpController.singUp(
                                formKey: _key,
                                context: context,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: mainGreen,
                              fixedSize: Size(
                                context.screenWidth * 0.5,
                                context.screenHeight * 0.04,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
