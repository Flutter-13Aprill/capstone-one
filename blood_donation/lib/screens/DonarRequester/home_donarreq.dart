import 'package:blood_donation/exstenshon/exstenshon.dart';
import 'package:blood_donation/screens/DonarRequester/ask_donor_homeScreen.dart';
import 'package:blood_donation/theems/color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeDonarreq extends StatefulWidget {
  const HomeDonarreq({super.key});

  @override
  State<HomeDonarreq> createState() => _HomeDonarreqState();
}

class _HomeDonarreqState extends State<HomeDonarreq> {
  final List<Map<String, dynamic>> items = [
    {
      'image': 'images/Vector (1).png',
      'text': 'Found Donor',
      'route': AskDonorHomeScreen(),
    },
    {'image': 'images/Vector2.png', 'text': 'Request Donor', 'route': ()},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10),
            ListTile(
              title: Text("welcome", style: TextStyle(fontSize: 30)),
              subtitle: Text("dhruv chauhan", style: TextStyle(fontSize: 16)),
              trailing: Image.asset("images/notification icon.png"),
            ),
            SizedBox(height: 40),
            SizedBox(
              height: 170,
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Image.asset("images/Slider.png"),
                    Image.asset("images/Image and Text.png"),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),
            Container(
              height: context.gethight() / 9,
              width: context.getWidth() / 1.14,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: myAppColor.graycolor,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AskDonorHomeScreen(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.asset("images/Vector (1).png"),
                      SizedBox(width: 10),
                      Text(
                        "find_donars_button".tr(),
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: context.gethight() / 9,
              width: context.getWidth() / 1.14,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: myAppColor.graycolor,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AskDonorHomeScreen(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.asset("images/Friend Icon.png"),
                      SizedBox(width: 10),
                      Text("invite_frind".tr(), style: TextStyle(fontSize: 25)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: context.gethight() / 9,
              width: context.getWidth() / 1.14,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: myAppColor.graycolor,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Icon(Icons.logout, size: 40),
                      SizedBox(width: 10),
                      Text("log_out".tr(), style: TextStyle(fontSize: 25)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
