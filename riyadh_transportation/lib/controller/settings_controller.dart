import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riyadh_transportation/screen/signin_screen.dart';
import 'package:riyadh_transportation/style/app_colors.dart';

class SettingsController {
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  static bottomSheet(context, setLocale) {
    if (context.languageCode == "ar") {
      setLocale(Locale("en", "US"));
    } else {
      setLocale(Locale("ar", "AR"));
    }
    scaffoldKey.currentState!.showBottomSheet(
      (context) => Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        height: 100,
        child: Center(
          child:
              Text(
                "Change language successfully",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ).tr(),
        ),
      ),
    );
  }

  static logout(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(
            "Are you sure want to\n Logout?",
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "No",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SigninScreen()),
                );
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "yes",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
