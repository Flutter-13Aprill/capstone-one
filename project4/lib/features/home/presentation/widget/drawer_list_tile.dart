import 'package:flutter/material.dart';
import 'package:project4/core/widget/custom_list_tile.dart';
import 'package:project4/features/home/presentation/controller/home_controller.dart';

class DrawerListTile extends StatelessWidget {
  DrawerListTile({super.key});
  final homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListTile(title: Text("Edit Profile"), child: Icon(Icons.edit)),
        CustomListTile(
          title: Text("Language"),
          child: Icon(Icons.language),
          onTap: () {
            homeController.showLanguageDialog(context);
          },
        ),
        CustomListTile(
          title: Text("Appearance"),
          child: Icon(Icons.color_lens),
        ),
        CustomListTile(
          title: Text("Privacy & Security"),
          child: Icon(Icons.lock),
        ),
        CustomListTile(
          title: Text("Logout"),
          child: Icon(Icons.logout),
          onTap: () {
            homeController.logOutShowDialog(context);
          },
        ),
      ],
    );
  }
}
