import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shabah/extensions/screen_size.dart';
import 'package:shabah/main.dart';
import 'package:shabah/style/app_colors.dart';
import 'package:shabah/widgets/profile_screen/shimmer_effect.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            SizedBox(height: context.getHeight(multiplied: 0.07),),

            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  width: context.getWidth(),
                  height: context.getHeight(multiplied: 0.2),
                  decoration: BoxDecoration(
                    color: AppColors.tertiaryColor,
                    borderRadius: BorderRadius.circular(24)
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: context.getHeight(multiplied: 0.08)),

                      Text(profile.userName, style: Theme.of(context).textTheme.labelLarge,),

                      SizedBox(height: context.getHeight(multiplied: 0.03)),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text('ID: 23414', style: TextStyle(color: AppColors.primaryColor),),

                          Text(context.tr('joined_date_text'), style: TextStyle(color: AppColors.primaryColor))
                        ],
                      )
                    ],
                  ),
                ),

                Positioned(
                  right: context.getWidth() / 2.5,
                  top: -20,
                  child: ShimmerEffect()
                  )
                
              ],
            ),

            SizedBox(height: context.getHeight(multiplied: 0.04)),

            ListTile(leading: Icon(Icons.history_outlined), title: Text(context.tr('order_history_text'))),

            SizedBox(height: context.getHeight(multiplied: 0.01)),

            InkWell(
              onTap: () {
                if(context.locale.languageCode == 'en'){
                  setState(() {
                    context.setLocale(Locale('ar'));
                  });
                }else{
                  context.setLocale(Locale('en'));
                }
              },
              child: ListTile(leading: Icon(Icons.language), title: Text(context.tr('change_language_text', args: [context.locale.languageCode == "en" ? "Arabic" : "English"])))
              ),

            SizedBox(height: context.getHeight(multiplied: 0.01)),

            ListTile(leading: Icon(Icons.delete, color: Colors.red,), title: Text(context.tr('delete_account'))),
          ],
        ),
      ),
    );
  }
}