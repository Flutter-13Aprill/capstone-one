import 'package:capstone1/Screens/nav_bar.dart';
import 'package:capstone1/Screens/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void signUp({required BuildContext context}) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const SignUpScreen()),
    );
  }

  void singIn({
    required GlobalKey<FormState> formKey,
    required BuildContext context,
  }) {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const NavBar()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("Incorrect Email or Password."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }
}
