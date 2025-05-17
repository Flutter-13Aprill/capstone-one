import 'package:capstone/extensions/size.dart';
import 'package:capstone/screens/home_screen.dart';
import 'package:capstone/screens/leaderboard_screen.dart';
import 'package:capstone/screens/profile_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BottomNavHandler extends StatefulWidget {
  const BottomNavHandler({super.key});

  //bottom navigation bar to navigate between pages

  @override
  State<BottomNavHandler> createState() => _BottomNavHandlerState();
}

class _BottomNavHandlerState extends State<BottomNavHandler> {
  int currentNav = 0;
  List<Widget> screen = [HomeScreen(), LeaderboardScreen(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //to show current page
      body: screen[currentNav],
      bottomNavigationBar: SizedBox(
        height: context.getHieght() * 0.1,
        child: BottomNavigationBar(
          currentIndex: currentNav,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.black,
          onTap: (value) {
            currentNav = value;
            setState(() {});
          },
          items: [
            // home button
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'bottomNavHome'.tr(),
            ),
            //leaderboard button
            BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard),
              label: 'bottomNavLeaderboard'.tr(),
            ),
            //profile button
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'bottomNavProfile'.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
