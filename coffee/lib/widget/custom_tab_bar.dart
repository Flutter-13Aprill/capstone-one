import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key, required this.title, required this.contanerColor, required this.textColor});
  final String title;
  final Color contanerColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 45,
        decoration: BoxDecoration(
          color: contanerColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(title, style: TextStyle(color: textColor, fontSize: 16)),
        ),
      );
  }
}