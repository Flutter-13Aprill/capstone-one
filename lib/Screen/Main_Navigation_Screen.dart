import 'package:app_design_implementation/Controllers/App_Themes.dart';
import 'package:app_design_implementation/Providers/Them_Provider.dart';
import 'package:app_design_implementation/Screen/Favorite_Template_Screen.dart';
import 'package:app_design_implementation/Screen/Home_Screen.dart';
import 'package:app_design_implementation/Screen/Profile_Screen.dart';
import 'package:app_design_implementation/Screen/Template_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  _MainNavigationScreenState createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    TemplateScreen(),
    FavoriteTemplate(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF2D2B40) : const Color(0xFFC3DAFE),
      body: IndexedStack(index: _currentIndex, children: _screens),
bottomNavigationBar: Container(
  decoration: BoxDecoration(
    gradient: isDark
        ? const LinearGradient(
            colors: [Color(0xFF3A3456), Color(0xFF2D2B40)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
        : AppThemes.gradientBackground.gradient,
  ),
  child: BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.transparent,
    elevation: 0,
    currentIndex: _currentIndex,
    selectedItemColor: isDark ? const Color(0xFFBFA0FF) : const Color(0xFF3B0CA8),
    unselectedItemColor: isDark ? Colors.white60 : const Color(0xFF5D3A86),
    selectedLabelStyle: TextStyle(
      color: isDark ? const Color(0xFFBFA0FF) : const Color(0xFF3B0CA8),
      fontWeight: FontWeight.w600,
    ),
    unselectedLabelStyle: TextStyle(
      color: isDark ? Colors.white60 : const Color(0xFF5D3A86),
    ),
    onTap: (index) => setState(() => _currentIndex = index),
    items: [
      BottomNavigationBarItem(
        icon: _animatedIcon(Icons.home, 0, isDark),
        label: 'nav_home'.tr(),
      ),
      BottomNavigationBarItem(
        icon: _animatedIcon(Icons.library_books_rounded, 1, isDark),
        label: 'nav_template'.tr(),
      ),
      BottomNavigationBarItem(
        icon: _animatedIcon(Icons.favorite, 2, isDark),
        label: 'nav_favorite'.tr(),
      ),
      BottomNavigationBarItem(
        icon: _animatedIcon(Icons.person_2, 3, isDark),
        label: 'nav_profile'.tr(),
      ),
    ],
  ),
),

    );
  }

  Widget _animatedIcon(IconData icon, int index, bool isDark) {
  bool isSelected = _currentIndex == index;
  return AnimatedContainer(
    duration: const Duration(milliseconds: 250),
    curve: Curves.easeInOut,
    transform: Matrix4.translationValues(0, isSelected ? -4 : 0, 0),
    child: Icon(
      icon,
      size: isSelected ? 28 : 24,
      color: isSelected
          ? (isDark
              ? const Color(0xFFBFA0FF)
              : const Color(0xFF3B0CA8)) 
          : isDark
              ? Colors.white60
              : const Color(0xFF5D3A86),
    ),
  );
}

}
