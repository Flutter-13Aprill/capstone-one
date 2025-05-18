import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project4/core/controller/bottom_nav_bar_controller.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final controller = BottomNavBarController();
  navigationBar(int currentIndex) {
    setState(() {
      controller.selected = currentIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.page[controller.selected],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.selected,
        onTap: navigationBar,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "asset/icons/receipts.svg",
              //  colorFilter: ColorFilter.mode(color, blendMode)
            ),
            label: 'Receipts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
