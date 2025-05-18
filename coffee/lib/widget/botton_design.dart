import 'package:coffee/style/app_colors.dart';
import 'package:flutter/material.dart';

class BottonDesign extends StatelessWidget {
  const BottonDesign({super.key, required this.lable, required this.width});
  final String lable;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.sizeOf(context).width * width,
        height: 55,
        decoration: BoxDecoration(
          color: AppColors.brown,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            lable,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
        ),
      );
  }
}