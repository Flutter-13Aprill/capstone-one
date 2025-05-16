
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:taskins_stress_relief_app/screens/account_screen.dart';
import 'package:taskins_stress_relief_app/screens/explore_screen.dart';
import 'package:taskins_stress_relief_app/screens/home_screen.dart';
import 'package:taskins_stress_relief_app/themes/styles/app_colors.dart';

import 'package:taskins_stress_relief_app/themes/theme_manager.dart';


class NavBar extends StatefulWidget {
 final List<String> initialSubtasks;

    final int initialIndex;
    NavBar({super.key, this.initialIndex = 1,  required this.initialSubtasks}); 


  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
    late List<String> activeSubtasks;

   late int currentIndex;

  

  @override
  void initState() {
    super.initState();
      currentIndex = widget.initialIndex;
    activeSubtasks = widget.initialSubtasks;
  }


  @override
  Widget build(BuildContext context) {
       final themeManager = Provider.of<ThemeManager>(context);
       final List<Widget> pages = [
  const ExploreScreen(),
    HomeScreen(initialSubtasks: activeSubtasks),
   
    const AccountScreen(),
  ];
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: themeManager.themeMode == ThemeMode.dark
          ? AppColors.darkOrange
          : AppColors.lightOrange,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        selectedItemColor: themeManager.themeMode == ThemeMode.dark
          ? AppColors.darkReddishBrown
          : AppColors.reddishBrown,// Font color for selected items
        unselectedItemColor:AppColors.reddishBrown, // Font color for unselected items
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          letterSpacing: 0.8,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: currentIndex == 0
                  ? SvgPicture.asset("lib/assets/svgs/more_filled.svg", width: 25)
                  : SvgPicture.asset("lib/assets/svgs/more.svg", width: 25),
            ),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: currentIndex == 1
                  ? SvgPicture.asset("lib/assets/svgs/home_filled.svg", width: 25)
                  : SvgPicture.asset("lib/assets/svgs/home.svg", width: 25),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: currentIndex == 2
                  ? SvgPicture.asset("lib/assets/svgs/account_filled.svg", width: 25)
                  : SvgPicture.asset("lib/assets/svgs/account.svg", width: 25),
            ),
            label: "Account",
          ),
          
        ],
      ),
    );
  }
}





