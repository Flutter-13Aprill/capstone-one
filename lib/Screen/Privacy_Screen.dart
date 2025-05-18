import 'package:app_design_implementation/Controllers/App_Themes.dart';
import 'package:app_design_implementation/Providers/Them_Provider.dart';
import 'package:app_design_implementation/Screen/Main_Navigation_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  Widget _gradientText(String text, double fontSize) {
    return ShaderMask(
      shaderCallback: (bounds) => AppThemes.titleGradient.createShader(bounds),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: fontSize,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _bulletPoint(BuildContext context, String text) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "• ",
            style: TextStyle(
              color: isDark ? Colors.white : Colors.black,
              fontSize: 18,
              height: 1.5,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: isDark ? Colors.white70 : Colors.black87,
                fontSize: 16,
                height: 1.6,
              ),
              textAlign: TextAlign.start,
              textDirection: Directionality.of(context),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: _gradientText('privacy_policy'.tr(), 28),
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
        width: double.infinity,
        height: double.infinity,
        decoration: isDark
            ? const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF4B3D6B), Color(0xFF24243E)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              )
            : AppThemes.gradientBackground,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Icon(
                    Icons.privacy_tip_rounded,
                    size: 80,
                    color: isDark ? Colors.white : Colors.deepPurple,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'your_privacy_matters'.tr(),
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),

                  // Bullet Points
                  _bulletPoint(context, 'bullet_user_data'.tr()),
                  _bulletPoint(context, 'bullet_template_usage'.tr()),
                  _bulletPoint(context, 'bullet_data_security'.tr()),
                  _bulletPoint(context, 'bullet_media_access'.tr()),
                  _bulletPoint(context, 'bullet_analytics_use'.tr()),
                  _bulletPoint(context, 'bullet_consent_notice'.tr()),

                  const SizedBox(height: 40),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFBFA0FF), Color(0xFF836FFF)],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const MainNavigationScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'accept_and_continue'.tr(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
