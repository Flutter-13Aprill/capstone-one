import 'package:capstone1/Controllers/login_controller.dart';
import 'package:capstone1/CustomWidgets/AuthScreens/email_field.dart';
import 'package:capstone1/CustomWidgets/AuthScreens/password_field.dart';
import 'package:capstone1/CustomWidgets/white_container.dart';
import 'package:capstone1/Helpers/screen_extinsion.dart';
import 'package:capstone1/Styling/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<FormState>();

  final LoginController loginController = LoginController();

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
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Text(
                  textAlign: TextAlign.center,
                  "Welcome",
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
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          EmailField(
                            emailController: loginController.emailController,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          PasswordField(
                            label: "Password",
                            passwordController:
                                loginController.passwordController,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              loginController.singIn(
                                context: context,
                                formKey: _key,
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
                              "Login",
                              style: TextStyle(
                                color: darkModeGreen,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: darkModeGreen,
                              fontSize: 16,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: lightGreen,
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
                                color: darkModeGreen,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          RichText(
                            text: TextSpan(
                              text: "Use ",
                              style: TextStyle(
                                color: darkModeGreen,
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  text: "Fingerprint",

                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: " To Access ",
                                      style: TextStyle(color: darkModeGreen),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text(
                            "Or sign up with",
                            style: TextStyle(
                              color: darkModeGreen,
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/google.png',
                                height: 30,
                                width: 30,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Image.asset(
                                'assets/images/facebook.png',
                                height: 30,
                                width: 30,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          RichText(
                            text: TextSpan(
                              text: "Don't have an account?",
                              style: TextStyle(
                                color: darkModeGreen,
                                fontSize: 13,
                              ),
                              children: [
                                TextSpan(
                                  recognizer:
                                      TapGestureRecognizer()
                                        ..onTap = () {
                                          loginController.signUp(
                                            context: context,
                                          );
                                        },
                                  text: " Sign Up",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
}
