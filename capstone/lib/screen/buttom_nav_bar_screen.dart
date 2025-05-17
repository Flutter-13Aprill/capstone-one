import 'package:flutter/material.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

import 'home_screen.dart';
import 'reservations_screen.dart';
import 'add_meal_screen.dart';
import 'profile_screen.dart';

class ButtomNavBarScreen extends StatefulWidget {
  const ButtomNavBarScreen({super.key});

  @override
  State<ButtomNavBarScreen> createState() => _ButtomNavBarScreenState();
}

class _ButtomNavBarScreenState extends State<ButtomNavBarScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    ReservationsScreen(),
    AddMealScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final background = theme.scaffoldBackgroundColor;
    final activeColor = theme.colorScheme.primary;

    return Scaffold(
      backgroundColor: background,
      body: _pages[_selectedIndex],
      bottomNavigationBar: WaterDropNavBar(
        backgroundColor: background,
        waterDropColor: activeColor,
        selectedIndex: _selectedIndex,
        onItemSelected: (index) => setState(() => _selectedIndex = index),
        barItems: [
          BarItem(filledIcon: Icons.home, outlinedIcon: Icons.home_outlined),
          BarItem(
              filledIcon: Icons.history, outlinedIcon: Icons.history_outlined),
          BarItem(
              filledIcon: Icons.add_circle,
              outlinedIcon: Icons.add_circle_outline),
          BarItem(filledIcon: Icons.person, outlinedIcon: Icons.person_outline),
        ],
      ),
    );
  }
}
