import 'package:flutter/material.dart';
import 'package:save_your_money_app/screens/budget_planner_screen.dart';
import 'package:save_your_money_app/screens/home_screen.dart';
import 'package:save_your_money_app/screens/profile_screen.dart';

class BottomNavbarController {
  int selectedIndex = 1;

  // List of screens to display based on selected index

  final List<Widget> pages = [
    BudgetPlannerScreen(),
    HomeScreen(),
    ProfileScreen(),
  ];
}
