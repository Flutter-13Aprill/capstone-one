// ignore_for_file: use_build_context_synchronously

import 'package:local_auth/local_auth.dart'; // 1️⃣
import 'package:capstone1/Screens/nav_bar.dart';
import 'package:capstone1/Screens/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LocalAuthentication _auth = LocalAuthentication(); // 2️⃣

  void signUp({required BuildContext context}) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const SignUpScreen()));
  }

  void signIn({
    required GlobalKey<FormState> formKey,
    required BuildContext context,
  }) {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const NavBar()),
      );
    } else {
      _showErrorDialog(context);
    }
  }

  Future<void> authenticateWithBiometrics({
    required BuildContext context,
  }) async {
    try {
      // Check if device supports biometrics
      final bool canCheck = await _auth.canCheckBiometrics;
      final bool isSupported = await _auth.isDeviceSupported();
      if (!canCheck || !isSupported) {
        _showSnackBar(context, 'Biometric authentication not available');
        return;
      }

      // Attempt authentication
      final bool didAuthenticate = await _auth.authenticate(
        localizedReason: 'Please authenticate to sign in',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      if (didAuthenticate) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const NavBar()),
        );
      } else {
        _showSnackBar(context, 'Authentication failed');
      }
    } catch (e) {
      _showSnackBar(context, 'Error: $e');
    }
  }

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Error"),
            content: const Text("Incorrect Email or Password."),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("OK"),
              ),
            ],
          ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
