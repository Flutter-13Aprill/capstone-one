import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:ui' as ui;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:laundry/screen/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),

        shadowColor: Colors.black,
        elevation: 5.0,

        backgroundColor: Color.fromARGB(255, 245, 245, 220),

        toolbarHeight: 100,

        automaticallyImplyLeading: false,

        title: Text(
          "Shatha",
          style: TextStyle(
            fontSize: 32,
            color: const Color.fromARGB(166, 0, 0, 0),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: 20),
              // isLoading
              //     ? Shimmer.fromColors(
              //       baseColor: const Color.fromARGB(255, 164, 160, 160),
              //       highlightColor: const Color.fromARGB(255, 218, 11, 11)!,
              //       child: Container(
              //         width: 300,
              //         color: const Color.fromARGB(255, 137, 11, 11),
              //       ),
              //     ):
              Stack(
                children: [
                  SizedBox(width: 20),
                  Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.boxOpen,
                                  color: Colors.black,
                                ),
                                Text(
                                  "   My Orders",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 10, 104, 94),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.language,
                                  color: Colors.black,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "   Language",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color.fromARGB(255, 10, 104, 94),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Directionality(
                                      textDirection:
                                          (context.locale.languageCode == 'ar')
                                              ? ui.TextDirection.rtl
                                              : ui.TextDirection.ltr,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("".tr()),
                                          Text("".tr()),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: 8.0,
                                            ),
                                            child: ElevatedButton(
                                              onPressed: () async {
                                                if (context
                                                        .locale
                                                        .languageCode ==
                                                    'ar') {
                                                  await context.setLocale(
                                                    const Locale('en'),
                                                  );
                                                } else {
                                                  await context.setLocale(
                                                    const Locale('ar'),
                                                  );
                                                }
                                              },
                                              child: Text(
                                                (context.locale.languageCode ==
                                                        'ar')
                                                    ? 'English'
                                                    : 'Arabic',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Icon(Icons.exit_to_app, color: Colors.black),
                                // Text(
                                //   "     Logout",
                                //   style: TextStyle(
                                //     fontSize: 16,
                                //     color: Color.fromARGB(255, 10, 104, 94),
                                //     fontWeight: FontWeight.bold,
                                //   ),
                                // ),
                                InkWell(
                                  child: Text(
                                    "     Logout",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 10, 104, 94),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onTap: () {
                                    showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          child: Container(
                                            height: 100,
                                            width: 90,
                                            padding: EdgeInsets.all(8),
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Logout from app?",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder:
                                                            (context) =>
                                                                LoginScreen(),
                                                      ),
                                                    );
                                                  },
                                                  child: Text("Logout"),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              //---------------------------------------------
            ],
          ),
        ],
      ),
    );
  }
}
