import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskins_stress_relief_app/themes/styles/app_colors.dart';
import 'package:taskins_stress_relief_app/themes/styles/app_fonts.dart';
import 'package:taskins_stress_relief_app/themes/theme_manager.dart';


class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

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

  Row(
    children: [
      SizedBox(width: 32),
      Text("Wind down".tr(), style: AppFonts.fontSizeTwo,),
    ],
  ),
  SizedBox(height: 16,),
  Container(
    height: 210,
   
      child: Padding(
        padding: const EdgeInsets.only(left:32.0, right: 32, bottom: 16),
        child: PageView(
          children: [
              _buildWindDown(context, "Your Dairy".tr(), AppColors.pink,"lib/assets/images/pen-2.png",(){Navigator.pushReplacementNamed(context,  '/journal');}),
            _buildWindDown(context, "Breathing Technique".tr(),AppColors.green,"lib/assets/images/Group.png",(){Navigator.pushReplacementNamed(context,  '/breathing');}),
             _buildWindDown(context, "Mini Games".tr(), AppColors.lavender,"lib/assets/images/joystick.png",(){Navigator.pushReplacementNamed(context,  '/games');}),
             _buildWindDown(context, "Mood Tracker".tr(), AppColors.yellow,"lib/assets/images/emotional.png",(){Navigator.pushReplacementNamed(context,  '/moodtracker');}),
             _buildWindDown(context, "Chat with AI".tr(), AppColors.orange,"lib/assets/images/robot.png",(){Navigator.pushReplacementNamed(context,  '/aichatbot');}),
          ],
        ),
      ),
      
    
  ),

GestureDetector(
  onTap: (){
    Navigator.pushNamed(context, '/awardroom',);
  },
  child: Container(
  width:356,
      height: 250,
     decoration: BoxDecoration(
    color: themeManager.themeMode == ThemeMode.dark
            ? AppColors.darkLavender
            : AppColors.lavender,
    borderRadius: BorderRadius.circular(20),
    border: Border.all(
      color: AppColors.reddishBrown, 
      width:3,
    )
      ),
      child: Column(
        children: [
          SizedBox(height: 38),
          Image.asset("lib/assets/images/trophy.png"),
          SizedBox(height: 16),
          Text("Your Award Room".tr(), style: AppFonts.fontSizeFour,),
        ],
      )
  ),
)



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


Widget _buildWindDown(BuildContext context,  String text, Color backgroundColor, String ImagePath, VoidCallback onPressed,  )
{
return
GestureDetector(
  onTap: onPressed,
  child: Container(
    width:350,
    height: 150,
   decoration: BoxDecoration(
  color: backgroundColor,
  borderRadius: BorderRadius.circular(20),
  border: Border.all(
    color: AppColors.reddishBrown, 
    width:3,
  )
    ),
    child: Column(children: [
      SizedBox(height: 32),
          Row(
            children: [
              SizedBox(width: 120),
              SizedBox(
                child: Image.asset(ImagePath, width: 81, height: 70,   fit: BoxFit.fitHeight,)),

            ],
          ),
         SizedBox(height: 14),
          Expanded(
            child: Text(
              text,
              style: AppFonts.fontSizeThree
            ),
          ),
             
    ],),
  ),
);

}