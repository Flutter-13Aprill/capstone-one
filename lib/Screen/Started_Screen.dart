import 'package:app_design_implementation/Controllers/Started_Screen_Controller.dart';
import 'package:app_design_implementation/Widgets/Started_DotIndicator_Widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_design_implementation/Screen/Login_Signup_Screen.dart';
import 'package:easy_localization/easy_localization.dart';

class StartedScreen extends StatelessWidget {
  StartedScreen({super.key});

  final List<Map<String, String>> onboardingData = [
    {
      "title": "welcome",
      "description": "welcome_description",
      "image": "assets/onboarding1.png",
    },
    {
      "title": "templates",
      "description": "templates_description",
      "image": "assets/onboarding2.png",
    },
    {
      "title": "get_started",
      "description": "get_started_description",
      "image": "assets/onboarding3.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => StartedScreenController(),
      child: Consumer<StartedScreenController>(
        builder: (context, pageManager, child) {
          return Scaffold(
            backgroundColor: const Color(0xFF1E1A2B),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: pageManager.pageController,
                      onPageChanged: pageManager.updatePage,
                      itemCount: onboardingData.length,
                      itemBuilder: (context, index) {
                        final data = onboardingData[index];
                        return Column(
                          children: [
                            if (index == 0)
                              Align(
                                alignment: Alignment.topRight,
                                child: PopupMenuButton<Locale>(
                                  icon: const Icon(Icons.language, color: Colors.white),
                                  onSelected: (Locale locale) {
                                    context.setLocale(locale);
                                  },
                                  itemBuilder: (context) => [
                                    PopupMenuItem(
                                      value: const Locale('en'),
                                      child: const Text("English"),
                                    ),
                                    PopupMenuItem(
                                      value: const Locale('ar'),
                                      child: const Text("العربية"),
                                    ),
                                  ],
                                ),
                              ),
                            const SizedBox(height: 20),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                data["image"]!,
                                height: 400,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(height: 40),
                            ShaderMask(
                              shaderCallback: (bounds) => const LinearGradient(
                                colors: [Color(0xFFBFA0FF), Colors.white],
                              ).createShader(bounds),
                              child: Text(
                                data["title"]!.tr(),
                                style: const TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              data["description"]!.tr(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[300],
                                height: 1.5,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardingData.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: StartedDotIndicatorWidget(
                          isActive: pageManager.currentPage == index,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  GestureDetector(
                    onTap: () {
                      if (pageManager.currentPage < onboardingData.length - 1) {
                        pageManager.nextPage();
                      } else {
                        pageManager.goToLogin();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginSignupScreen()),
                        );
                      }
                    },
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFBFA0FF), Color(0xFF836FFF)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepPurple.withOpacity(0.5),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: const Icon(Icons.arrow_forward, size: 30, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
