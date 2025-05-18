import 'package:flutter/material.dart';
import 'package:project_flow/Theme/app_colors.dart';
import 'package:project_flow/controllers/theme_controller.dart';

Widget cardProfileWidget({required String text,required Function? OnTap ,bool isSwitch=false}) {

  return InkWell(
    onTap: () {
     OnTap ==null? print("null") :OnTap();
      },
    child: Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.border, // You can choose your border color
          width: 1.0, // You can adjust the border width
        ),
        borderRadius: BorderRadius.circular(10.0), // You can adjust the radius
      ),
      child: ListTile(
        title: Text(text),
        // trailing: Icon(Icons.arrow_forward_ios_rounded),
        trailing: isSwitch? Switch(
              value: ThemeController.isDark,
              onChanged: (value) => ThemeController.toggleTheme(value),
            ):Icon(Icons.arrow_forward_ios_rounded),
      ),
    ),
  );
}
