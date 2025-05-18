import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laundry/screen/home_screen.dart';
import 'package:laundry/screen/orders_screen.dart';
import 'package:laundry/screen/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentPage = 2;
  final List<Widget> pages = [
    const ProfileScreen(),
    const OrdersScreen(),

    const HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,

        unselectedItemColor: Color.fromARGB(255, 139, 140, 140),

        type: BottomNavigationBarType.fixed,

        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.userLarge, size: 25),
            label: 'Profile',
          ),
          const BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.basketShopping, size: 30),
            label: 'Orders',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 35),
            label: 'Home',
          ),
        ],
      ),
    );
  }
}
