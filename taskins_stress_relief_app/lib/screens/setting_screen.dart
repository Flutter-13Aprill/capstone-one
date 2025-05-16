import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskins_stress_relief_app/themes/styles/app_colors.dart';
import 'package:taskins_stress_relief_app/themes/theme_manager.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, '/home');
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.reddishBrown),
        ),
        elevation: 0,
        backgroundColor: themeManager.themeMode == ThemeMode.dark
            ? AppColors.darkOrange
            : AppColors.lightOrange,
      ),
      backgroundColor: themeManager.themeMode == ThemeMode.dark
          ? AppColors.darkOrange
          : AppColors.lightOrange,
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 16),
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
                  border: Border.all(
                    color: const Color(0xFF8C3117),
                    width: 4,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                   
                    const SizedBox(width: 10),
                    
                    
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // Language Toggle
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "change_language".tr(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Switch(
                      value: context.locale.languageCode == 'ar',
                      onChanged: (bool value) {
                        if (value) {
                          context.setLocale(const Locale('ar', 'AR'));
                        } else {
                          context.setLocale(const Locale('en', 'US'));
                        }
                      },
                      activeColor: const Color(0xFF8C3117),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

