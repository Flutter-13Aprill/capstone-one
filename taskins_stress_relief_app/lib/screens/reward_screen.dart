import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskins_stress_relief_app/themes/styles/app_colors.dart';
import 'package:taskins_stress_relief_app/themes/styles/app_fonts.dart';
import 'package:taskins_stress_relief_app/themes/theme_manager.dart';

class RewardScreen extends StatefulWidget {
  const RewardScreen({super.key});

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  @override
  Widget build(BuildContext context) {
      final themeManager = Provider.of<ThemeManager>(context);
    return Scaffold(
     
  backgroundColor: themeManager.themeMode == ThemeMode.dark
          ? AppColors.darkOrange
          : AppColors.lightOrange,
body: Stack(children: [
         Column(
            children: [
                SizedBox(height: 100),
              Container(
               width: 430,
                height: 824,
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
                  SizedBox(height: 80),
              Text("congratulations", style: AppFonts.fontSizeOne), 
               SizedBox(height: 20,),
                Text("You've won an item", style: AppFonts.fontSizeFour),
                 SizedBox(height: 80,),
                 Center(child: Container(
                  width: 210,
                  height: 210,
                  child: Image.asset("lib/assets/images/frame.png"))),
                  SizedBox(height: 100,),
                 Container(
                  decoration:BoxDecoration(
                    border: Border.all(
                      color: AppColors.reddishBrown,
                      width:3
                    ),
                    borderRadius: BorderRadius.circular(22)
                  ),
                   child: ElevatedButton(onPressed: () async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('hasFrame', true);

  // Navigate to the room screen
  Navigator.pushNamed(context, '/awardroom');
},

                                  style:   ElevatedButton.styleFrom(
                         elevation: 0,  // Remove default shadow
                         backgroundColor: AppColors.pink,  // Make the background transparent
                         padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                         
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(20),
                         ),
                         
                       ),
                   
                   
                    child: Text("Go to award room", style: AppFonts.fontSizeFour),),
                 )



                ]),

            )
            ]),



        
      ],)

    );
  }
}