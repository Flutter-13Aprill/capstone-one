import 'package:flutter/material.dart';
import 'package:capstone/style/colors.dart';
import 'package:capstone/screen/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<String> imagePaths = [
    'assets/images/timage.png',
    'assets/images/bording.png',
    'assets/images/onimage.png',
  ];

  void _nextPage() {
    if (_currentIndex < 2) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Color primary = AppColors.primaryRed;
    final Color secondary = AppColors.lightBackground;

    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        onPageChanged: (index) => setState(() => _currentIndex = index),
        itemCount: 3,
        itemBuilder: (_, index) {
          final bool isEven = index % 2 == 0;
          final backgroundColor = isEven ? secondary : primary;
          final textColor = isEven ? Colors.black : Colors.white;
          final descriptionColor = isEven ? Colors.black54 : Colors.white70;
          final buttonBg = isEven ? primary : Colors.white;
          final buttonText = isEven ? Colors.white : primary;

          return Container(
            color: backgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  Expanded(
                    child: Image.asset(
                      imagePaths[index],
                      width: 280,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'onboard_${index + 1}_title'.tr(),
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'onboard_${index + 1}_desc'.tr(),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: descriptionColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (dotIndex) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _currentIndex == dotIndex ? 16 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _currentIndex == dotIndex
                              ? buttonBg
                              : Colors.grey[400],
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: _nextPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonBg,
                      foregroundColor: buttonText,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 12),
                    ),
                    child: Text(
                      _currentIndex == 2 ? 'start'.tr() : 'next'.tr(),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 16, top: 32),
        child: Align(
          alignment: Alignment.topRight,
          child: TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            },
            child: Text(
              "skip".tr(),
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: 16,
                color: AppColors.primaryRed,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
