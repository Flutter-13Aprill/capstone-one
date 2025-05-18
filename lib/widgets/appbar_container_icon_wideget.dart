import 'package:flutter/material.dart';
import 'package:project_flow/Theme/app_colors.dart';

class AppbarContainerIconWideget extends StatelessWidget {
  const AppbarContainerIconWideget({super.key, this.icon, this.imagePath, required this.onTap,    this.size = 20,this.isLeading =false,  });
  final Icon? icon;
  final String? imagePath;
  final Function onTap;
  final double size; 
  final bool isLeading;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>onTap(),
      child: Container(
        padding: EdgeInsets.all(isLeading? 10 :5),
        margin: EdgeInsets.all(isLeading?5:4),
        width: size+4,
        height: size+4,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.textHint, width: 1),
          borderRadius: BorderRadius.circular(32),
        ),

        child: icon?? Image.asset(color: Theme.of(context).iconTheme.color,imagePath!) ,
      ),
    );
  }
}
