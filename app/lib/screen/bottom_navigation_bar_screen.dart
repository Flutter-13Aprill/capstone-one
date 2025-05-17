import 'package:app/screen/flight_search_screen.dart';
import 'package:app/screen/profile_screen.dart';
import 'package:app/screen/reservations_screen.dart.dart';
 import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  List<Widget> pages = [  // State class for the BottomNavigationBarScreen.
 // List of pages to navigate to.
    FlightSearchScreen(),
    ReservationsScreen(),
    ProfileScreen(),
  ];
  int currentIndex = 0; // List of pages to navigate to.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex], // Display the page corresponding to the current index.
      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed, // BottomNavigationBar with fixed item layout.
        onTap: (val) {          // Callback when a bottom navigation item is tapped.
          setState(() {
            currentIndex = val;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search), // Search icon.
            label: "search".tr(), // Localized "search" label.
          ),
             BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket), // Localized "search" label.
            label: "Reservations".tr(),// Localized "Reservations" label.
          ),
           
          BottomNavigationBarItem(
            icon: Icon(Icons.person),// Person icon.
            label: "profile".tr(),//Localized "profile" label.
          ),
        ],
      ),
    );
  }
}
