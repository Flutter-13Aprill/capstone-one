import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_flow/Theme/app_colors.dart';
import 'package:project_flow/widgets/mainButton_wideget.dart';

class View1 extends StatelessWidget {
  const View1({super.key, required this.nextPage});
  final Function nextPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "onBording.v1.projectName".tr(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.info,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "onBording.v1.t1".tr()
         ,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
           "onBording.v1.t2".tr()
          ,
          textAlign: TextAlign.center,

          style: TextStyle(
            color: AppColors.textHint,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 42),
       MainbuttonWideget(nextPage:nextPage, text:   "onBording.v1.t3".tr() ,)
      ],
    );
  }
}
