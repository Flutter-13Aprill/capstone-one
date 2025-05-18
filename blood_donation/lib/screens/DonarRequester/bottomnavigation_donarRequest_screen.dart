import 'package:blood_donation/screens/Donar/profile.dart';
import 'package:blood_donation/screens/DonarRequester/request_donor.dart';
import 'package:blood_donation/theems/color.dart';
import 'package:flutter/material.dart';

class BottomnavigationDonarrequestScreen extends StatefulWidget {
  const BottomnavigationDonarrequestScreen({super.key});

  @override
  State<BottomnavigationDonarrequestScreen> createState() =>
      _BottomnavigationDonarrequestScreenState();
}

int indexGlobal = 0;

class _BottomnavigationDonarrequestScreenState
    extends State<BottomnavigationDonarrequestScreen> {
  @override
  Widget build(BuildContext context) {
    final List pages = [Profile(), RequestDonor()];
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
          NavigationDestination(
            icon: Icon(Icons.data_saver_on),
            label: "donar",
          ),
          NavigationDestination(icon: Icon(Icons.explore), label: "state"),
        ],
      ),
    );
  }
}
