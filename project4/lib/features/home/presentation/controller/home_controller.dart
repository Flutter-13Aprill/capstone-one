import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project4/core/function/navigaation.dart';
import 'package:project4/features/auth/presentation/page/login_page.dart';
import 'package:project4/features/home/presentation/widget/edit_button.dart';

class HomeController {
  void logOutShowDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Colors.deepPurple[100],
            title: const Text("LogOut"),
            content: const Text("Do you want to Logout?"),
            actions: [
              TextButton(
                onPressed: () {
                  customPushReplacement(context, LoginPage());
                },
                child: const Text("OK"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
            ],
          ),
    );
  }

  void showLanguageDialog(BuildContext context) {
    String selectedLang = context.locale.languageCode;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple[100],
          title: const Text("Choose Language"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  EditButton(
                    onPressed: () {
                      selectedLang = 'ar';
                    },
                    text: "العربية",
                  ),
                  EditButton(
                    onPressed: () {
                      selectedLang = 'en';
                    },

                    text: "English",
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cancel
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (selectedLang == 'ar') {
                  context.setLocale(const Locale('ar', 'AR'));
                } else {
                  context.setLocale(const Locale('en', 'US'));
                }
                Navigator.pop(context); // OK
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
