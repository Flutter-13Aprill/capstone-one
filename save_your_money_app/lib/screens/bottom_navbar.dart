import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:save_your_money_app/controllers/bottom_navbar_controller.dart';
// import 'package:save_your_money_app/screens/home_screen.dart';
// import 'package:save_your_money_app/screens/budget_planner_screen.dart';
// import 'package:save_your_money_app/screens/profile_screen.dart';

class BottomNavbarScreen extends StatefulWidget {
  const BottomNavbarScreen({super.key});

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  BottomNavbarController controller = BottomNavbarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Display the currently selected screen
      body: Center(child: controller.pages.elementAt(controller.selectedIndex)),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1)),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,

              // Space between icon and text
              gap: 8,
              activeColor: Theme.of(context).primaryColor,

              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor:
                  (Theme.of(context).textTheme.bodyLarge!.color)!,

              color: Colors.grey,
              tabs: [
                GButton(
                  icon: Icons.account_balance_wallet_outlined,
                  text: 'budget_planner'.tr(),
                ),
                GButton(icon: Icons.home, text: 'home'.tr()),
                GButton(icon: Icons.person_2_outlined, text: 'profile'.tr()),
              ],

              // Update the selected index when a tab is tapped
              selectedIndex: controller.selectedIndex,
              onTabChange: (index) {
                setState(() {
                  controller.selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
