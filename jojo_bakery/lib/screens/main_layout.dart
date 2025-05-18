import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jojo_bakery/screens/cart_screen.dart';
import 'package:jojo_bakery/screens/home_screen.dart';
import 'package:jojo_bakery/screens/profile_screen.dart';
import 'package:jojo_bakery/theme/app_colors.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});
  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;
  final List<Widget> pages = const [
    HomeScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.primary,
        currentIndex: currentIndex,
        selectedItemColor: AppColors.secondary,
        unselectedItemColor: AppColors.white,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home1'.tr()),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'cart'.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile'.tr(),
          ),
        ],
      ),
    );
  }
}
