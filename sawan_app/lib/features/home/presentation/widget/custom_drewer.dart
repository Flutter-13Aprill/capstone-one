import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:sawan_app/core/theme/app_palette.dart';
import 'package:sawan_app/core/widget/custom_elevated_button.dart';

import 'package:sawan_app/features/home/presentation/widget/custom_avatar.dart';

class CustomDrewer extends StatelessWidget {
  const CustomDrewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppPalette.primeryColorWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40, width: 40),
          CustomAvatar(),
          SizedBox(height: 50),
          CustomElvatedButton(
            press: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Log Out".tr()),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("نعم"),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text("Log OUT button".tr()),
            width: 200,
            height: 50,
          ),
          IconButton(
            onPressed: () {
              if (context.locale.languageCode == 'ar') {
                context.setLocale(Locale('en', 'US'));
              } else {
                context.setLocale(Locale('ar', 'AR'));
              }
            },

            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
