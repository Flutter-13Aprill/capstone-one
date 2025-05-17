import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riyadh_transportation/controller/settings_controller.dart';
import 'package:riyadh_transportation/style/app_colors.dart';
import 'package:riyadh_transportation/style/app_text_styles.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: SettingsController.scaffoldKey,
      appBar: AppBar(title: Text("Settings")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            ListTile(
              tileColor: Colors.white,
              title: Text("Wake me", style: AppTextStyles.settingText).tr(),
              leading: Icon(Icons.browse_gallery, color: AppColors.primary),
              onTap: () {},
            ),
            SizedBox(height: 16),
            ListTile(
              tileColor: Colors.white,
              title:
                  Text("Notifications", style: AppTextStyles.settingText).tr(),
              leading: Icon(
                Icons.notifications_active_rounded,
                color: AppColors.primary,
              ),
              onTap: () {},
            ),
            SizedBox(height: 16),
            ListTile(
              tileColor: Colors.white,
              title:
                  Text(
                    "Change the language to Arabic",
                    style: AppTextStyles.settingText,
                  ).tr(),
              leading: Icon(Icons.language, color: AppColors.primary),
              onTap: () {
                SettingsController.bottomSheet(
                  context.locale,
                  context.setLocale,
                );
                setState(() {});
              },
            ),
            SizedBox(height: 16),
            ListTile(
              tileColor: Colors.white,
              title: Text("Log out", style: AppTextStyles.settingText).tr(),
              leading: Icon(Icons.login, color: Colors.red),
              onTap: () {
                SettingsController.logout(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
