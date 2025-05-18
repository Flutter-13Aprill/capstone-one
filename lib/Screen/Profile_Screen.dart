import 'dart:io';
import 'package:app_design_implementation/Controllers/App_Themes.dart';
import 'package:app_design_implementation/Providers/Them_Provider.dart';
import 'package:app_design_implementation/Screen/About_Screen.dart';
import 'package:app_design_implementation/Screen/Delete_Account_Screen.dart';
import 'package:app_design_implementation/Screen/Edit_Profile_Screen.dart';
import 'package:app_design_implementation/Screen/Main_Navigation_Screen.dart';
import 'package:app_design_implementation/Screen/Suggestions_Screen.dart';
import 'package:app_design_implementation/Widgets/Profile_MenuItem_Widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = 'John Doe';
  String userEmail = 'johndoe@gmail.com';
  String userImagePath = "Profile.png";

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('user_name') ?? 'John Doe';
      userEmail = prefs.getString('user_email') ?? 'johndoe@gmail.com';
      userImagePath = prefs.getString('profile_image') ?? "Profile.png";
    });
  }

  Widget _gradientText(String text, double fontSize) {
    return ShaderMask(
      shaderCallback: (bounds) => AppThemes.titleGradient.createShader(bounds),
      child: Text(
        text.tr(),
        style: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeProvider>().isDarkMode;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const MainNavigationScreen()),
            );
          },
          icon: ShaderMask(
            shaderCallback:
                (bounds) => AppThemes.titleGradient.createShader(bounds),
            child: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
        ),
        title: _gradientText('profile_title', 32),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: isDark
              ? const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF4B3D6B), Color(0xFF24243E)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                )
              : AppThemes.gradientBackground,
        ),
      ),
      body: Container(
        decoration: isDark
            ? const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF4B3D6B), Color(0xFF24243E)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              )
            : AppThemes.gradientBackground,
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 90,
                backgroundImage: userImagePath != "Profile.png"
                    ? File(userImagePath).existsSync()
                        ? FileImage(File(userImagePath))
                        : const AssetImage('assets/Profile.png')
                    : const AssetImage('assets/Profile.png') as ImageProvider,
              ),
              const SizedBox(height: 20),
              Text(
                userName,
                style: TextStyle(
                  color: isDark ? Colors.white : const Color(0xFF5D3A86),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                userEmail,
                style: TextStyle(
                  color:
                      isDark ? const Color(0xFF53C2EF) : Colors.deepPurple,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 32),
              Container(
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF2D2B40) : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: isDark
                          ? Colors.black.withOpacity(0.2)
                          : Colors.grey.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ProfileMenuitemWidget(
                      icon: Icons.edit,
                      color:
                          isDark ? const Color(0xFF53C2EF) : Colors.deepPurple,
                      label: 'edit_profile'.tr(),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const EditProfileScreen(),
                          ),
                        ).then((_) {
                          _loadProfileData();
                        });
                      },
                    ),
                    Divider(
                      color: isDark
                          ? Colors.white10
                          : Colors.deepPurple.shade100,
                      height: 2,
                    ),
                    ProfileMenuitemWidget(
                      icon: Icons.feedback,
                      color: isDark
                          ? const Color(0xFF00C853)
                          : Colors.green.shade700,
                      label: 'suggestions'.tr(),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SuggestionsScreen(),
                          ),
                        );
                      },
                    ),
                    Divider(
                      color: isDark
                          ? Colors.white10
                          : Colors.deepPurple.shade100,
                      height: 1,
                    ),
                    ProfileMenuitemWidget(
                      icon: Icons.info_outline,
                      color: isDark
                          ? const Color(0xFFFFAB00)
                          : Colors.orange.shade700,
                      label: 'about'.tr(),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AboutScreen(),
                          ),
                        );
                      },
                    ),
                    Divider(
                      color: isDark
                          ? Colors.white10
                          : Colors.deepPurple.shade100,
                      height: 1,
                    ),
                    ProfileMenuitemWidget(
                      icon: Icons.delete_outline,
                      color: isDark
                          ? Colors.redAccent.shade400
                          : Colors.red,
                      label: 'delete_account'.tr(),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const DeleteAccountScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
