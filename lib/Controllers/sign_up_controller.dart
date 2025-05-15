import 'package:capstone1/Screens/nav_bar.dart';
import 'package:flutter/material.dart';

class SignUpController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  void singUp({
    required GlobalKey<FormState> formKey,
    required BuildContext context,
  }) {
    if (formKey.currentState!.validate()) {
      if (passwordController.text.trim() ==
          confirmPasswordController.text.trim()) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const NavBar()),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Error"),
              content: const Text(
                "Password and Confirm Password do not match.",
              ),
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
