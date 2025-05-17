import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riyadh_transportation/screen/settings_screen.dart';
import 'package:riyadh_transportation/style/app_colors.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.asset("assets/images/header.png", width: 100),
        ListTile(
          title: Text("Account").tr(),
          leading: Icon(Icons.person_2, color: AppColors.primary),
          onTap: () {},
        ),
        ListTile(
          title: Text("About Us").tr(),
          leading: Icon(Icons.help, color: AppColors.primary),
          onTap: () {},
        ),
        ListTile(
          title: Text("Contact us").tr(),
          leading: Icon(Icons.phone, color: AppColors.primary),
          onTap: () {},
        ),
        ListTile(
          title: Text("Settings").tr(),
          leading: Icon(Icons.settings, color: AppColors.primary),
          onTap: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => SettingsScreen()));
          },
        ),
      ],
    );
  }
}
