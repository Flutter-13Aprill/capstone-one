import 'package:capstone/controller/auth_controller.dart';
import 'package:capstone/screen/buttom_nav_bar_screen.dart';
import 'package:capstone/screen/login_screen.dart';
import 'package:capstone/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final controller = AuthController();
  final _formKey = GlobalKey<FormState>();
  bool agreed = false;

  void _signup() {
    if (_formKey.currentState!.validate() && agreed) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const ButtomNavBarScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("sign_up".tr()),
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        foregroundColor: theme.colorScheme.onBackground,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text("register".tr(),
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 12),
              TextFormField(
                controller: controller.nameController,
                decoration: InputDecoration(labelText: 'full_name'.tr()),
                validator: (value) => value!.isEmpty ? 'enter_name'.tr() : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: controller.emailController,
                decoration: InputDecoration(labelText: 'email'.tr()),
                validator: (value) => controller.isEmailValid(value!)
                    ? null
                    : 'invalid_email'.tr(),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: controller.passwordController,
                decoration: InputDecoration(labelText: 'password'.tr()),
                obscureText: true,
                validator: (value) => controller.isPasswordValid(value!)
                    ? null
                    : 'password_short'.tr(),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: controller.confirmPasswordController,
                decoration: InputDecoration(labelText: 'confirm_password'.tr()),
                obscureText: true,
                validator: (value) => controller.doPasswordsMatch(
                        controller.passwordController.text, value!)
                    ? null
                    : 'password_mismatch'.tr(),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    activeColor: AppColors.primaryRed,
                    value: agreed,
                    onChanged: (val) => setState(() => agreed = val!),
                  ),
                  Expanded(
                    child: Text("agree_terms".tr()),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _signup,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryRed,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Text("create_account".tr(),
                    style: const TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 20),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    );
                  },
                  child: Text("have_account".tr(),
                      style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.primaryRed,
                          fontWeight: FontWeight.w600)),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ButtomNavBarScreen()),
                    );
                  },
                  child: Text("continue_guest".tr(),
                      style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.primaryRed,
                          fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
