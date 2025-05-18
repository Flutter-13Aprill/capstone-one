import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_circle_left_outlined, color: Colors.white),
        ),
        centerTitle: true,
        title:
            Text("Settings".tr(), style: TextStyle(color: Colors.white)).tr(),
      ),

      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.lightGreen,
            borderRadius: BorderRadius.circular(15),
          ),
          child: SizedBox(
            width: 250,
            height: 135,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    if (context.locale.languageCode == "ar") {
                      context.setLocale(Locale("en"));
                      return;
                    } else {
                      context.setLocale(Locale("ar"));
                      return;
                    }
                  },
                  child: ListTile(
                    leading: Icon(Icons.language),
                    title: Text("Change Language").tr(),
                  ),
                ),
                Divider(color: Colors.black,),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Container(
                            width: 150,
                            height: 150,
                            padding: EdgeInsets.all(16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Press to Close"),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text("Logout").tr(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
