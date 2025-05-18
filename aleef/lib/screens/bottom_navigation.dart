import 'package:aleef/screens/care_routine_screen.dart';
import 'package:aleef/screens/community_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Implements a bottom navigation bar to switch between CareRoutineScreen and CommunityScreen.
class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  // Track the current selected index
  int selectedIndex = 0;
  // List of screens
  final List<Widget> screens = const [CareRoutineScreen(), CommunityScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Display the screen based on the selected index
      body: screens[selectedIndex],

      //controls the bottom navigation bar at the screen's bottom
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'careRoutine'.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: 'community'.tr(),
          ),
        ],
        // Set the current selected index
        currentIndex: selectedIndex,
        // Update selected index
        onTap: (value) {
          selectedIndex = value;
          setState(() {});
        },
      ),
    );
  }
}
