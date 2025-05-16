import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskins_stress_relief_app/themes/styles/app_colors.dart';
import 'package:taskins_stress_relief_app/themes/theme_manager.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  @override
  Widget build(BuildContext context) {
      final themeManager = Provider.of<ThemeManager>(context);
    return Scaffold(
      appBar: AppBar(
                leading: IconButton(onPressed: (){
          Navigator.popAndPushNamed(context, '/explore');
        }, icon:Icon(Icons.arrow_back_ios, color: AppColors.reddishBrown)),
        elevation: 0,
         backgroundColor: themeManager.themeMode == ThemeMode.dark
          ? AppColors.darkOrange
          : AppColors.lightOrange,
        actions: [
         
        ],
      ),
  backgroundColor: themeManager.themeMode == ThemeMode.dark
          ? AppColors.darkOrange
          : AppColors.lightOrange,
body: Stack(children: [
         Column(
            children: [
                SizedBox(height: 16),
              Container(
               width: 430,
                height: 806,
                decoration: BoxDecoration(
                  color: themeManager.themeMode == ThemeMode.dark
          ? AppColors.darkCream
          : AppColors.cream,
                   borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                ),
                  border: Border(
                    top: BorderSide(
              color: Color(0xFF8C3117),
              width: 4,
                    ),
                    left: BorderSide(
              color: Color(0xFF8C3117),
              width: 4,
                    ),
                    right: BorderSide(
              color: Color(0xFF8C3117),
              width: 4,
                    ),
                    
                ),
                ),
              
                child: Column( children: [
                   SizedBox(height: 48),







                ]),

            )
            ]),



        
      ],)

    );
  }
}