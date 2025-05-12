import 'package:capstone1/CustomWidgets/HomeScreen/Drawer/tiles.dart';
import 'package:capstone1/Helpers/screen_extinsion.dart';
import 'package:capstone1/Styling/colors.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: lightGreen,

      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: DrawerHeader(
              decoration: BoxDecoration(color: mainGreen),
              child: Center(),
            ),
          ),
          Positioned(
            top: context.screenHeight * 0.21,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: lightGreen,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(height: context.screenHeight * 0.04),
                  Text(
                    'Solaiman AlDokhail',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: darkModeGreen,
                    ),
                  ),
                  Text(
                    "ID: 123456789",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: darkModeGreen),
                  ),
                  SizedBox(height: context.screenHeight * 0.01),
                  Tiles(),
                ],
              ),
            ),
          ),
          Positioned(
            top: context.screenHeight * 0.15,
            left: context.screenWidth * 0.05,
            right: context.screenWidth * 0.05,
            child: Container(
              height: context.screenHeight * 0.09,
              width: context.screenWidth * 0.6,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/pfp.png'),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
