import 'package:flutter/material.dart';
import 'package:project_flow/Theme/app_colors.dart';
import 'package:project_flow/view/layout_view.dart';
import 'package:project_flow/view/signup_view/signup_viwe.dart';
import 'package:project_flow/widgets/appbar_container_icon_wideget.dart';
import 'package:project_flow/widgets/container_icon_widget.dart';
import 'package:project_flow/widgets/mainButton_wideget.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final _formKey = GlobalKey<FormState>();

  List<String> errors = [];

  Map<String, Map<String, String>> errorMessages = {
    "email": {
      "emptyEmail": "Please enter your email",
      "invalidEmail": "Enter a valid email address",
    },
    "password": {
      "emptyPassword": "Please enter your password",
      "weakPassword":
          "Password must be 6+ chars and include upper, lower, digit, and special char",
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: AppbarContainerIconWideget(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          isLeading: true,

          onTap: () => Navigator.pop(context),
        ),

        title: Text("Sign In"),
      ),
      body: GestureDetector(
        onTap: () {
            FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              // spacing: 32,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(width: 64, height: 49, "assets/login/pop.png"),
                ),
                SizedBox(height: 16),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
          
                Text(
                  "Please Inter your email address\nand password for Login",
                  style: TextStyle(color: AppColors.textHint, fontSize: 18),
                ),
                SizedBox(height: 42),
          
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Enter your email",
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            errors.add(errorMessages["email"]!["emptyEmail"]!);
                            return errorMessages["email"]!["emptyEmail"];
                          }
                          final emailRegex = RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$',
                          );
                          if (!emailRegex.hasMatch(value)) {
                            errors.add(errorMessages["email"]!["invalidEmail"]!);
                            return errorMessages["email"]!["invalidEmail"];
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 32),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter your password",
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock_outline),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            errors.add(
                              errorMessages["password"]!["emptyPassword"]!,
                            );
          
                            return errorMessages["password"]!["emptyPassword"];
                          }
                          // Min 6 chars, at least one uppercase, one lowercase, one digit, one special char
                          final passwordRegex = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                          );
          
                          if (!passwordRegex.hasMatch(value)) {
                            errors.add(errorMessages["password"]!["weakPassword"]!);
          
                            return errorMessages["password"]!["weakPassword"];
                          }
          
                          return null;
                        },
                      ),
          
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 32),
          
                      MainbuttonWideget(
                        nextPage: () {
                          errors.clear();
          
                          bool isValid = _formKey.currentState!.validate();
          
                          if (!isValid && errors.isNotEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(errors.join('\n')),
                                backgroundColor: AppColors.error,
                                duration: Duration(seconds: 4),
                              ),
                            );
                          } else if (isValid) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Login successful!"),
                                backgroundColor: AppColors.success,
                                duration: Duration(seconds: 2),
                              ),
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (builder) => LayoutView()),
                            );
                          }
                        },
                        text: "Sign in",
                      ),
          
                      SizedBox(height: 32),
                      Text(
                        "Signin with",
                        style: TextStyle(
                          color: AppColors.textHint,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 32),
          
                      Row(
                        spacing: 32,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ContainerIconWidget(
                            iconPath: "assets/login/apple.png",
                            onTap: null,
                          ),
                          ContainerIconWidget(
                            iconPath: "assets/login/google.png",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (builder) => LayoutView()),
                              );
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Not Registrar Yet? ",
                            style: TextStyle(
                              color: AppColors.textHint,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (builder) => SignupViwe(),
                                ),
                              );
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 14,
                              ),
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
      ),
    );
  }
}
