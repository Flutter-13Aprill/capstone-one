import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riyadh_transportation/controller/signin_controller.dart';
import 'package:riyadh_transportation/style/app_colors.dart';

class SigninWidget extends StatefulWidget {
  const SigninWidget({super.key});

  @override
  State<SigninWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<SigninWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Form(
        key: SigninController.formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text("Email / Username").tr(),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: SigninController.emailController,
                      validator:
                          (value) => SigninController.emailValidator(value),

                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(6),
                        ),

                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Enter your Username / Email".tr(),
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 26),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text("Password").tr(),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: SigninController.passController,
                      validator:
                          (value) => SigninController.passwordValidator(
                            value,
                            context,
                          ),
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(6),
                        ),

                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Enter your password".tr(),
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child:
                          Text(
                            "Forgot password?",
                            style: TextStyle(color: Colors.grey),
                          ).tr(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),

              TextButton(
                onPressed: () {
                  SigninController.formKey.currentState!.validate();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.primary,
                  ),
                  child: Center(
                    child:
                        Text(
                          "Sign In",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ).tr(),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dont have an account?").tr(),
                  TextButton(
                    onPressed: () {
                      SigninController.signupScreen(context);
                    },
                    child:
                        Text(
                          "New User",
                          style: TextStyle(color: Colors.green[900]),
                        ).tr(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
