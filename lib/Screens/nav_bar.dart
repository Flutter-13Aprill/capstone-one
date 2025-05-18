import 'package:capstone1/Controllers/balance_header_controller.dart';
import 'package:capstone1/Screens/analysis_screen.dart';
import 'package:capstone1/Screens/categories_screen.dart';
import 'package:capstone1/Screens/home_screen.dart';
import 'package:capstone1/Styling/colors.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final BalanceHeaderController balanceHeaderController =
      BalanceHeaderController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeScreen(balanceHeaderController: balanceHeaderController),
      AnalysisScreen(balanceHeaderController: balanceHeaderController),
      CategoriesScreen(balanceHeaderController: balanceHeaderController),
    ];
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: screens[_selectedIndex],
      bottomNavigationBar: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: lightGreen,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            backgroundColor: lightGreen,
            indicatorColor: mainGreen,

            indicatorShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
            labelTextStyle: WidgetStateProperty.all(
              TextStyle(color: darkModeGreen),
            ),
            iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
              if (states.contains(WidgetState.selected)) {
                return IconThemeData(color: darkModeGreen, size: 32);
              }
              return IconThemeData(color: darkModeGreen, size: 32);
            }),
          ),
          child: NavigationBar(
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onItemTapped,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            destinations: [
              NavigationDestination(
                icon: Image.asset(
                  "assets/images/home.png",
                  height: 30,
                  width: 30,
                ),
                label: '',
              ),
              NavigationDestination(
                icon: Image.asset(
                  "assets/images/analysis.png",
                  height: 30,
                  width: 30,
                ),
                label: '',
              ),
              NavigationDestination(
                icon: Image.asset(
                  "assets/images/categories.png",
                  height: 30,
                  width: 30,
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
