import 'package:flutter/material.dart';

// -- Screens
import 'package:shabah/screens/cart_screen.dart';
import 'package:shabah/screens/home_screen.dart';
import 'package:shabah/screens/profile_screen.dart';

// -- External Package
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// -- App Theming
import 'package:shabah/style/app_colors.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {

  List<Widget> screens = [HomeScreen(),CartScreen(), ProfileScreen()];
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: AppColors.tertiaryColor,
        backgroundColor: AppColors.tertiaryColor,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 400),
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        items: [
          Icon(Icons.home, color: pageIndex == 0 ? AppColors.primaryColor : AppColors.secondaryColor,),
          Icon(Icons.shopping_cart_sharp, color:  pageIndex == 1 ? AppColors.primaryColor : AppColors.secondaryColor,),
          Icon(Icons.person, color:  pageIndex == 2 ? AppColors.primaryColor : AppColors.secondaryColor,),
        ],
      ),

      body: screens.elementAt(pageIndex),
    );
  }
}