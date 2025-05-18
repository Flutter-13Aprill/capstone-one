import 'package:app_design_implementation/Controllers/App_Themes.dart';
import 'package:app_design_implementation/Providers/Template_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_design_implementation/Screen/main_navigation_screen.dart';
import 'package:app_design_implementation/Widgets/Template_Widget.dart';
import 'package:app_design_implementation/Providers/Them_Provider.dart';
import 'package:easy_localization/easy_localization.dart';

class TemplateScreen extends StatelessWidget {
  const TemplateScreen({super.key});

  // Reusable gradient text using AppThemes
  Widget _gradientText(String text, double fontSize) {
    return ShaderMask(
      shaderCallback: (bounds) => AppThemes.titleGradient.createShader(bounds),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final templates = Provider.of<TemplateProvider>(context).templates;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;

    // Language toggle button (optional)
    

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const MainNavigationScreen()),
            );
          },
          icon: ShaderMask(
            shaderCallback:
                (bounds) => AppThemes.titleGradient.createShader(bounds),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white, // Masked by ShaderMask
            ),
          ),
        ),
        title: _gradientText(tr('my_cvs'), 32),
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
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              )
            : AppThemes.gradientBackground,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF2D2B40) : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _gradientText(tr('purchased_templates'), 24),
                      const SizedBox(height: 30),
                      if (templates.isEmpty)
                        Center(
                          child: Text(
                            tr('no_templates_added_yet'),
                            style: TextStyle(
                              color: isDark ? Colors.white70 : Colors.black54,
                              fontSize: 16,
                            ),
                          ),
                        )
                      else
                        Column(
                          children: templates
                              .map(
                                (template) => Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 24,
                                  ),
                                  child: TemplateWidget(
                                    imagePath: template['imagePath']!,
                                    title: template['title']!,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
