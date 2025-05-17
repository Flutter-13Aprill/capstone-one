import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riyadh_transportation/controller/signup_controller.dart';
import 'package:riyadh_transportation/style/app_colors.dart';

class SignupWidget extends StatelessWidget {
  const SignupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Form(
        key: SignupController.formKey,
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
                      controller: SignupController.emailController,
                      validator:
                          (value) => SignupController.emailValidator(value),

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
                      controller: SignupController.passController,
                      validator:
                          (value) => SignupController.passwordValidator(value),
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
                      child: Text("Confirm Password").tr(),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: SignupController.confirmpassController,
                      validator:
                          (value) => SignupController.passwordValidator(value),
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(6),
                        ),

                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Confirm Password".tr(),
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),

              TextButton(
                onPressed: () {
                  SignupController.formKey.currentState!.validate();
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
            ],
          ),
        ),
      ),
    );
  }
}
