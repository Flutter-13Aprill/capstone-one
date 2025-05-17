import 'package:easy_localization/easy_localization.dart';
import 'package:capstone/controller/auth_controller.dart';
import 'package:capstone/screen/buttom_nav_bar_screen.dart';
import 'package:capstone/screen/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = AuthController();
  final _formKey = GlobalKey<FormState>();

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ButtomNavBarScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("login".tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Spacer(),
              Text(
                "welcome".tr(),
                style: theme.textTheme.headline6?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: controller.emailController,
                decoration: InputDecoration(labelText: 'email'.tr()),
                validator: (value) => controller.isEmailValid(value!)
                    ? null
                    : 'enter_valid_email'.tr(),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controller.passwordController,
                decoration: InputDecoration(labelText: 'password'.tr()),
                obscureText: true,
                validator: (value) => controller.isPasswordValid(value!)
                    ? null
                    : 'short_password'.tr(),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  minimumSize: const Size.fromHeight(50),
                ),
                child: Text("login".tr()),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ButtomNavBarScreen()),
                  );
                },
                child: Text(
                  "continue_guest".tr(),
                  style: TextStyle(color: theme.colorScheme.primary),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignupScreen()),
                  );
                },
                child: Text(
                  "dont_have_account".tr(),
                  style: TextStyle(color: theme.colorScheme.primary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
