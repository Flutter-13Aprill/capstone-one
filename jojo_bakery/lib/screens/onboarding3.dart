import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jojo_bakery/screens/main_layout.dart';
import 'package:jojo_bakery/screens/signup_screen.dart';
import 'package:jojo_bakery/theme/app_colors.dart';
import 'package:jojo_bakery/widgets/custom_button.dart';
import 'package:jojo_bakery/widgets/custom_icon_button.dart';

class OnBoardingThree extends StatefulWidget {
  const OnBoardingThree({super.key});

  @override
  State<OnBoardingThree> createState() => _OnBoardingThreeState();
}

class _OnBoardingThreeState extends State<OnBoardingThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: -7,
            right: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.71,
              child: Image.asset("assets/images/pic4.jpg", fit: BoxFit.cover),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainLayout()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.cardColors,
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 30,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'تسجيل الدخول',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                  SizedBox(height: 5),
                  CustomButton(
                    text: "  إنشاء حساب  ",
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.cardColors,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: Color(0xFF795548),
                    ),
                    child: Text("تخطي", style: TextStyle(fontSize: 18)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustmIconButton(
                        icon: FontAwesomeIcons.google,
                        color: AppColors.cardColors,
                        onPressed: () {},
                      ),
                      SizedBox(width: 20),
                      CustmIconButton(
                        icon: FontAwesomeIcons.apple,
                        color: AppColors.cardColors,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
