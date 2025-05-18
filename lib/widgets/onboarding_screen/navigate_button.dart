import 'package:flutter/material.dart';

// -- Screen
import 'package:shabah/screens/login_screen.dart';

// -- Extensions
import 'package:shabah/extensions/screen_size.dart';

// -- App Theme 
import 'package:shabah/style/app_colors.dart';

class NavigateButton extends StatefulWidget {
  const NavigateButton({super.key, required this.imagePath, required this.currentIndexPage, required this.pageController});

  final String imagePath;
  final int currentIndexPage;
  final PageController pageController;

  @override
  State<NavigateButton> createState() => _NavigateButtonState();
}

class _NavigateButtonState extends State<NavigateButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          if (widget.currentIndexPage == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          }
          widget.pageController.nextPage(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        });
      },

      child: Container(
        width: context.getHeight(multiplied: 0.06),
        height: context.getHeight(multiplied: 0.06),
        margin: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.tertiaryColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Image.asset(widget.imagePath),
      ),
    );
  }
}
