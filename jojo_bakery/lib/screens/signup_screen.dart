import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jojo_bakery/screens/main_layout.dart';
import 'package:jojo_bakery/theme/app_colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _keyForm = GlobalKey<FormState>();

  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController passwordconfirm = TextEditingController();
  void snackSignup() {
    final snack = SnackBar(
      backgroundColor: AppColors.secondary,
      content: Text(
        'signup_success'.tr(),
        style: TextStyle(color: AppColors.primary, fontSize: 15),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }

  void snackSignup1() {
    final snack = SnackBar(
      backgroundColor: AppColors.secondary,
      content: Text(
        'signup_wrong_password'.tr(),
        style: TextStyle(color: AppColors.primary, fontSize: 15),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('create_account'.tr()),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _keyForm,
          child: ListView(
            children: [
              Container(
                height: 150,
                width: 300,
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 150,
                  width: 300,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: usernamecontroller,
                decoration: InputDecoration(
                  labelText: 'username'.tr(),
                  labelStyle: TextStyle(color: AppColors.primary),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(33),
                    borderSide: BorderSide(color: Colors.grey, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(33),
                    borderSide: BorderSide(color: AppColors.primary, width: 2),
                  ),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter_username'.tr();
                  } else if (value.length <= 3) {
                    return 'username_min_length'.tr();
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  labelText: 'email'.tr(),
                  labelStyle: TextStyle(color: AppColors.primary),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(33),
                    borderSide: BorderSide(color: Colors.grey, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(33),
                    borderSide: BorderSide(color: AppColors.primary, width: 2),
                  ),
                ),

                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter_email'.tr();
                  } else if (!RegExp(
                    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                  ).hasMatch(value)) {
                    return 'invalid_email'.tr();
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              TextFormField(
                controller: passwordcontroller,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'password'.tr(),
                  labelStyle: TextStyle(color: AppColors.primary),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(33),
                    borderSide: BorderSide(color: Colors.grey, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(33),
                    borderSide: BorderSide(color: AppColors.primary, width: 2),
                  ),
                ),
                validator: (value) {
                  RegExp regex = RegExp(
                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                  );
                  if (value == null || value.isEmpty) {
                    return 'enter_valid_password'.tr();
                  } else if (value.length < 8) {
                    return 'password_min_length'.tr();
                  } else if (!regex.hasMatch(value)) {
                    return ("password_requirements".tr());
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              TextFormField(
                obscureText: true,
                controller: passwordconfirm,
                decoration: InputDecoration(
                  labelText: 'confirm_password'.tr(),
                  labelStyle: TextStyle(color: AppColors.primary),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(33),
                    borderSide: BorderSide(color: Colors.grey, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(33),
                    borderSide: BorderSide(color: AppColors.primary, width: 2),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'confirm_password_hint'.tr();
                  } else if (value != passwordcontroller.text) {
                    return 'password_mismatch'.tr();
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  if (_keyForm.currentState!.validate()) {
                    if (passwordcontroller.text != passwordconfirm.text) {
                      snackSignup1();
                    } else {
                      snackSignup();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainLayout()),
                      );
                    }
                  }
                },

                child: Text(
                  'signup'.tr(),
                  style: TextStyle(color: AppColors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
