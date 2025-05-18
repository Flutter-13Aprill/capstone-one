import 'package:app_design_implementation/Controllers/App_Themes.dart';
import 'package:app_design_implementation/Providers/Them_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeProvider>().isDarkMode;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: ShaderMask(
            shaderCallback: (bounds) => AppThemes.titleGradient.createShader(bounds),
            child: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: ShaderMask(
          shaderCallback: (bounds) => AppThemes.titleGradient.createShader(bounds),
          child: Text(
            tr('about_title'), // Translated title
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: isDark
              ? const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF4B3D6B), Color(0xFF24243E)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
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
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              )
            : AppThemes.gradientBackground,
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset("assets/Logo1.png", height: 120),
                const SizedBox(height: 20),
                ShaderMask(
                  shaderCallback: (bounds) => AppThemes.titleGradient.createShader(bounds),
                  child: Text(
                    tr('app_name'),
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  tr('about_description'),
                  style: TextStyle(
                    color: isDark ? Colors.white70 : Colors.black87,
                    fontSize: 16,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                _buildFeature(Icons.edit_note, tr('feature_edit'), isDark),
                _buildFeature(Icons.auto_awesome, tr('feature_templates'), isDark),
                _buildFeature(Icons.cloud_upload, tr('feature_cloud'), isDark),
                _buildFeature(Icons.lock, tr('feature_secure'), isDark),
                const SizedBox(height: 30),
                Text(
                  tr('app_version'),
                  style: TextStyle(
                    color: isDark ? Colors.white60 : Colors.grey[700],
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    gradient: AppThemes.titleGradient,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            children: [
                              const Icon(Icons.info_outline, color: Colors.white),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  tr('coming_soon'),
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          backgroundColor: const Color(0xFF836FFF),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          duration: const Duration(seconds: 3),
                        ),
                      );
                    },
                    icon: const Icon(Icons.open_in_new, color: Colors.white),
                    label: Text(
                      tr('check_other_apps'),
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  tr('contact_info'),
                  style: TextStyle(
                    color: isDark ? Colors.white54 : Colors.grey[800],
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeature(IconData icon, String title, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: isDark ? Colors.white : Colors.black87, size: 26),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: isDark ? Colors.white70 : Colors.black87,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
