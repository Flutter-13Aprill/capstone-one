import 'package:blood_donation/screens/Donar/donor_volunteer_screen.dart';
import 'package:blood_donation/screens/Donar/profile.dart';
import 'package:blood_donation/theems/color.dart';
import 'package:flutter/material.dart';

class BottomnavigationDonarScreen extends StatefulWidget {
  const BottomnavigationDonarScreen({super.key});

  @override
  State<BottomnavigationDonarScreen> createState() =>
      _BottomnavigationDonarScreenState();
}

int indexGlobal = 0;

class _BottomnavigationDonarScreenState
    extends State<BottomnavigationDonarScreen> {
  @override
  Widget build(BuildContext context) {
    final List pages = [DonorVolunteerScreen(), Profile()];
    return Scaffold(
      body: pages[indexGlobal],
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.transparent,
        backgroundColor: myAppColor.graycolor,
        selectedIndex: indexGlobal,
        onDestinationSelected: (value) {
          setState(() {
            indexGlobal = value;
          });
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.explore), label: "State"),
          NavigationDestination(icon: Icon(Icons.home), label: "home"),
        ],
      ),
    );
  }
}
