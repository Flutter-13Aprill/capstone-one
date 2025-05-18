import 'package:capstone1/Helpers/screen_extinsion.dart';
import 'package:capstone1/Screens/login_screen.dart';
import 'package:flutter/material.dart';

class Tiles extends StatelessWidget {
  const Tiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset(
              "assets/images/editprofile.png",
              height: context.screenHeight * 0.05,
            ),
            title: const Text('Edit Profile'),
            onTap: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset(
              "assets/images/security.png",
              height: context.screenHeight * 0.05,
            ),
            title: const Text('Security'),
            onTap: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset(
              "assets/images/settings.png",
              height: context.screenHeight * 0.05,
            ),
            title: const Text('Settings'),
            onTap: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset(
              "assets/images/logout.png",
              height: context.screenHeight * 0.05,
            ),
            title: const Text('Logout'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
        ),
      ],
    );
  }
}
