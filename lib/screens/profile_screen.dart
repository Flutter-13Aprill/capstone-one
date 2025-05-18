import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:spotify_redesign/widgets/collections/navigation_bar_destinations.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int buttomNavigationIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        centerTitle: true,
        title: Text("Profile".tr(), style: TextStyle(color: Colors.white)),
      ),

      bottomNavigationBar: NavigationBar(
        backgroundColor: Color.fromARGB(255, 51, 51, 51),
        indicatorColor: Colors.green,
        overlayColor: WidgetStateProperty.all(Colors.white),
        labelTextStyle: WidgetStateProperty.all(TextStyle(color: Colors.white)),
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.history_outlined, color: Colors.white),
            label: "History".tr(),
          ),
          NavigationDestination(
            icon: Icon(Icons.home_filled, color: Colors.white),
            label: "Home".tr(),
          ),
          NavigationDestination(
            icon: Icon(Icons.person, color: Colors.white),
            label: "Profile".tr(),
          ),
        ],
        selectedIndex: buttomNavigationIndex,
        onDestinationSelected: (value) {
          setState(() {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => navigationDestination[value],
              ),
            );
          });
        },
      ),

      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 8),
                CircleAvatar(radius: 75),
                SizedBox(height: 16),

                Text(
                  "Example Username",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                Text(
                  "example@example.com",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Followers".tr(),
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "123",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Following".tr(),
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "456",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
