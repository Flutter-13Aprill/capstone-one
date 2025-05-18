import 'package:flutter/material.dart';
import 'package:project_flow/Theme/app_colors.dart';

class MainbuttonWideget extends StatelessWidget {
  const MainbuttonWideget({super.key, required this.nextPage, required this.text});
  final Function nextPage;
  final String text;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
          onTap: (){  nextPage();},
          child: Container(
            alignment: Alignment.center,
            width: 295,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryDark, 
                  blurStyle: BlurStyle.normal,
                  spreadRadius: 2,
                  blurRadius: 12,
                  offset: Offset(0, 6), 
                ),
              ],
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.surface,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
  }
}