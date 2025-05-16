import 'package:app/extension/Screen/get_size_screen.dart';
import 'package:app/main.dart';
import 'package:app/screen/reservations_screen.dart.dart';
import 'package:app/screen/widgets/list_tile/profile_list_tile.dart';
import 'package:app/theme/style_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Function to show the logout confirmation dialog
  void showLogoutDialog(BuildContext context) {
    showDialog(
      //show AlertDialog
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            //display title
            "Logout Confirmation".tr(),
            style: Theme.of(context).textTheme.headlineLarge, //cutom style
          ),
          content: Text(
            //display content
            "Are you sure you want to log out?".tr(),
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                //Cancel text
                "Cancel".tr(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            //ElevatedButton with style
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  StyleColor.promaryBlueColor,
                ),
              ),

              onPressed: () {
                // Perform logout action
                Navigator.of(context).pop(); // Close the dialog
              }, //Logout with style
              child: Text(
                "Logout".tr(),
                style: Theme.of(
                  context,
                ).textTheme.titleSmall!.copyWith(fontSize: 14),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ProfileScreen")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: StyleColor.promaryBlueColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.flight, size: 40, color: Colors.white),
                  SizedBox(height: 8),
                  Text(
                    "airline".tr(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    "airline2".tr(),
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text(
                "about".tr(),
                style:
                    isDarkThem
                        ? Theme.of(context).textTheme.titleSmall
                        : Theme.of(context).textTheme.bodyMedium,
              ),
              onTap: () {
                Navigator.pop(context);
                showAboutDialog(
                  context: context,
                  applicationName: "airline".tr(),
                  applicationVersion: "version".tr(),
                  applicationIcon: Icon(Icons.flight),
                  children: <Widget>[
                    Text(
                      "ourapp".tr(),
                      style:
                          isDarkThem
                              ? Theme.of(context).textTheme.bodyMedium
                              : Theme.of(context).textTheme.headlineLarge,
                    ),
                    SizedBox(height: 8),
                    Text("ourapp2".tr(), style: TextStyle(fontSize: 14)),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: StyleColor.promarySecondBlueColor,
            ),
            margin: EdgeInsets.only(top: 16),
            child: Icon(Icons.person, size: 100),
          ),
          Column(
            children: [
              SizedBox(height: 40),
              Text(
                "welcomeNoor".tr(),
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                "noorfaha@gmail.com".tr(),
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 16),
              //
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReservationsScreen(),
                    ),
                  );
                },
                child: ProfileListTile(
                  leadingIcon: Icon(Icons.calendar_today),
                  title: "Reservation",
                  tralingIcon: Icon(Icons.arrow_forward_ios_outlined),
                  /* onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ReservationsScreen(),
                      ),
                    );
                  },*/
                ),
              ),
              SizedBox(height: 8),
              ProfileListTile(
                leadingIcon: Icon(Icons.favorite),
                title: "MyFavorites",
                tralingIcon: Icon(Icons.arrow_forward_ios_outlined),
              ),
              SizedBox(height: 8),
              ProfileListTile(
                leadingIcon: Icon(Icons.email),
                title: "messages",
                tralingIcon: Icon(Icons.arrow_forward_ios_outlined),
              ),
              ProfileListTile(
                leadingIcon: Icon(Icons.person),
                title: "personinformation",
                tralingIcon: Icon(Icons.arrow_forward_ios_outlined),
              ),
              SizedBox(height: 8),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        width: context.getWidth(),
                        height: context.getHeigth(),
                        child: Column(
                          children: [
                            ProfileListTile(
                              leadingIcon: Icon(Icons.person),
                              title: "passenger1",
                              tralingIcon: Icon(Icons.travel_explore_outlined),
                            ),
                            ProfileListTile(
                              leadingIcon: Icon(Icons.person),
                              title: "passenger2",
                              tralingIcon: Icon(Icons.travel_explore_outlined),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: ProfileListTile(
                  leadingIcon: Icon(Icons.people),
                  title: "passengers1",
                  tralingIcon: Icon(Icons.arrow_forward_ios_outlined),
                ),
              ),
              InkWell(
                onTap: () {
                  showLogoutDialog(context);
                },
                child: ProfileListTile(
                  leadingIcon: Icon(Icons.logout),
                  title: "logout",
                  tralingIcon: Icon(Icons.arrow_forward_ios_outlined),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
