import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riyadh_transportation/widget/auth/signup_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),

                child:
                    Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ).tr(),
              ),

              SizedBox(height: 16),
              SignupWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
