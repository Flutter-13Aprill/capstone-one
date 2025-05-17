import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sawan_app/core/theme/app_palette.dart';
import 'package:sawan_app/features/cart/presentation/pages/cart_screen.dart';
import 'package:sawan_app/features/favourite/pages/favorit_screen.dart';
import 'package:sawan_app/features/home/presentation/pages/home_screen.dart';
import 'package:sawan_app/features/product/presentation/pages/product_screen.dart';

class CustomNavbar extends StatefulWidget {
  CustomNavbar({super.key});

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  int selectIndex = 3;

  final List<Widget> pages = [
    CartScreen(),
    FavoritScreen(),
    ProductScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppPalette.primeryColorWhite,
        currentIndex: selectIndex,
        selectedItemColor: AppPalette.primeryColorBlue,
        unselectedItemColor: AppPalette.primeryColorBlue,
        selectedLabelStyle: TextStyle(color: AppPalette.primeryColorBlue),
        unselectedLabelStyle: TextStyle(color: AppPalette.primeryColorBlue),
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            selectIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined, size: 40),
            label: "cart".tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border, size: 40),
            label: "Favotiet".tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch, size: 40),
            label: "watches".tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 40),
            label: "Home".tr(),
          ),
        ],
      ),
    );
  }
}
