import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskins_stress_relief_app/themes/styles/app_colors.dart';
import 'package:taskins_stress_relief_app/themes/styles/app_fonts.dart';
import 'package:taskins_stress_relief_app/themes/theme_manager.dart';


class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
        final themeManager = Provider.of<ThemeManager>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
         backgroundColor: themeManager.themeMode == ThemeMode.dark
          ? AppColors.darkOrange
          : AppColors.lightOrange,
        actions: [
          Switch(value: themeManager.themeMode  == ThemeMode.dark, onChanged: (newValue)
          {
            themeManager.toggleTheme(newValue);
          }
          
          ),
        ],
      ),
  backgroundColor: themeManager.themeMode == ThemeMode.dark
          ? AppColors.darkOrange
          : AppColors.lightOrange,
body: Stack(children: [
         Column(
            children: [
                SizedBox(height: 120),
              Container(
               width: 430,
                height: 590,
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

                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset("lib/assets/images/profile.png", fit: BoxFit.cover,)),
                   Column(children: [
                    SizedBox(height: 10),
                   Row(children: [
                    SizedBox(width: 140,),
Text("Saja Ibrahim".tr(), style: AppFonts.fontSizeFour,),
Icon(Icons.edit, color: AppColors.reddishBrown,)
                   ],),
                     SizedBox(height: 28),
                    Row(children: [
               SizedBox(width: 40,),
           Text("My friends".tr(), style: AppFonts.fontSizeFive,),
            SizedBox(width: 200,),
            Text("see all".tr(), style: AppFonts.fontSizeSix,),
                    ],),
                       SizedBox(height: 16),
                     Row(children: [
                       SizedBox(width: 30,),
                      Image.asset("lib/assets/images/friend1.png"),
                      SizedBox(width: 6,),
                       Image.asset("lib/assets/images/friend2.png"),
                       SizedBox(width: 6,),
                        Image.asset("lib/assets/images/friend3.png"),
                        SizedBox(width: 6,),
                         Image.asset("lib/assets/images/friend4.png"),
                         SizedBox(width: 6,),
                          Image.asset("lib/assets/images/friend5.png"),
                    ],),
                   
                   ],)




                ]),

            )
            ]),
 Positioned(
        top:30,
        left: 40,
        child: 
      Image.asset(
                "lib/assets/images/amazing_cat.png",
                cacheWidth: 600,
              ),
      
      ),


        
      ],)

    );
  }
}
