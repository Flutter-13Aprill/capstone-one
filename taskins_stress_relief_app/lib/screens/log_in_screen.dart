
 import 'package:flutter/material.dart';

import 'package:taskins_stress_relief_app/themes/styles/app_colors.dart';


import 'package:taskins_stress_relief_app/themes/styles/app_fonts.dart';


class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}



class _LogInScreenState extends State<LogInScreen> {
  bool isRemembered = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightOrange,
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            // Background Image
         
            // Login Form
            Padding(
  padding: const EdgeInsets.only(top: 200.0),
  child: Center(
    child: Container(
      height: 579,
      width: 350,
      decoration: BoxDecoration(
        color: AppColors.cream,
        border: Border.all(
          color: AppColors.reddishBrown,
          width: 4,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(37)),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 48),
            Text("Log In", style: AppFonts.fontSizeTwo),
            const SizedBox(height: 24),

            // Email TextFormField
            SizedBox(
              width: 300,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter your Email",
                  labelText: "Email",
                  hintStyle: AppFonts.fontSizeFive,
                  labelStyle: AppFonts.fontSizeFive,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: AppColors.reddishBrown,
                      width: 3,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: AppColors.reddishBrown,
                      width: 3,
                    ),
                  ),
                   errorBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: AppColors.reddishBrown,
                      width: 3,
                    ),),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16),

            // Password TextFormField
            SizedBox(
              width: 300,
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter your Password",
                  labelText: "Password",
                  hintStyle: AppFonts.fontSizeFive,
                  labelStyle: AppFonts.fontSizeFive,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: AppColors.reddishBrown,
                      width: 3,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: AppColors.reddishBrown,
                      width: 3,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: AppColors.reddishBrown,
                      width: 3,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: AppColors.reddishBrown,
                      width: 3,
                    ),),
                  filled: true,
                  fillColor: AppColors.white,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 48),

            // Log In Button
            SizedBox(
              width: 176,
              height: 49,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0XFFF3A398),
                  elevation: 0,
                  foregroundColor: const Color(0xFF8C3117),
                  side: const BorderSide(
                    color: Color(0xFF8C3117),
                    width: 3,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )
                ),
                child: Text("Log In", style: AppFonts.fontSizeFour),
              ),
            ),
            const SizedBox(height: 32),
             

                      // Social Media Login
                      Text("Or Sign In with", style: AppFonts.fontSizeSix),
                      const SizedBox(height: 22),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("lib/assets/icons/facebook.png", width: 35, height: 35),
                          const SizedBox(width: 16),
                          Image.asset("lib/assets/icons/google.png", width: 35, height: 35),
                          const SizedBox(width: 16),
                          Image.asset("lib/assets/icons/apple.png", width: 35, height: 35),
                        ],
                      ),
                      const SizedBox(height: 32),

                      // Sign Up Link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account",
                            style: AppFonts.fontSizeFive
                          ),
                          const SizedBox(width: 6),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, '/signup');

                            },
                            child: Text(
                              "Sign Up",
                              style: AppFonts.fontSizeSix,
                            ),
                          )
                             ]     ),
          ],
        ),
      ),
    ),
  ),
),
             Positioned(
     top: 100,
        child: 
      Image.asset(
                "lib/assets/images/amazing_cat.png",
                cacheWidth: 600,
              ),)
          ],
        ),
      ),
    );
  }
}