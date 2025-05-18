import 'package:coffee/extensions/extensions.dart';
import 'package:coffee/screens/favorite_screen.dart';
import 'package:coffee/screens/home_screen.dart';
import 'package:coffee/screens/login_screen.dart';
import 'package:coffee/style/app_colors.dart';
import 'package:coffee/widget/custom_profile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profile'.tr(), style: TextStyle(fontSize: 16)),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(width: 20),
                      Text('setting'.tr()),
                    ],
                  ),
                  Divider(),
                  GestureDetector(
                    onTap: () {
                      if (context.locale.languageCode == 'ar') {
                        context.setLocale(Locale('en', 'US'));
                      } else {
                        context.setLocale(Locale('ar', 'AR'));
                      }
                    },
                    child: Row(
                      children: [
                        Icon(Icons.language),
                        SizedBox(width: 20),
                        Text('To arabic'.tr()),
                      ],
                    ),
                  ),

                  Divider(),

                  Row(
                    children: [
                      Icon(Icons.signal_cellular_alt_2_bar_outlined),
                      SizedBox(width: 20),
                      Text('analitics'.tr()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 16),
            isLoading
                ? Shimmer.fromColors(
                  baseColor: Colors.grey[700]!,
                  highlightColor: Colors.grey[500]!,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey[800],
                  ),
                )
                : CircleAvatar(
                  radius: 60,
                  backgroundColor: AppColors.tranparent,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/Image.png',
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
            const SizedBox(height: 16),
            isLoading
                ? Shimmer.fromColors(
                  baseColor: Colors.grey[700]!,
                  highlightColor: Colors.grey[500]!,
                  child: Container(
                    width: 120,
                    height: 16,
                    color: Colors.grey[800],
                  ),
                )
                : Text('Change Profile'.tr(), style: TextStyle(fontSize: 16)),
            SizedBox(height: 14),
            isLoading
                ? Shimmer.fromColors(
                  baseColor: Colors.grey[700]!,
                  highlightColor: Colors.grey[500]!,
                  child: Container(
                    width: context.getWidth() * 1,
                    height: 380,
                    decoration: BoxDecoration(color: Colors.grey[800]),
                  ),
                )
                : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomProfile(
                      text: 'change theme'.tr(),
                      icon: Icon(Icons.mode_night),
                    ), // custom content to profile
                    Divider(color: AppColors.gray, thickness: 0.3),
                    CustomProfile(
                      text: 'security'.tr(),
                      icon: Icon(Icons.security),
                    ),
                    Divider(color: Colors.grey, thickness: 0.3),
                    CustomProfile(
                      text: 'information'.tr(),
                      icon: Icon(Icons.info),
                    ),
                    Divider(color: Colors.grey, thickness: 0.3),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Confirm Logout".tr()),
                              content: Text("are you sure to logout?".tr()),
                              actions: [
                                TextButton(
                                  child: Text("NO".tr()),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                                TextButton(
                                  child: Text("Yes".tr()),
                                  onPressed:
                                      () => Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ),
                                      ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: CustomProfile(
                        text: 'Log Out'.tr(),
                        icon: Icon(Icons.logout),
                      ),
                    ),
                  ],
                ),
          ],
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        height: 70,
        color: AppColors.lightGray,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Icon(Icons.home, color: AppColors.gray, size: 40),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => FavoriteScreen()),
                  );
                },
                child: Icon(
                  Icons.heart_broken,
                  color: AppColors.gray,
                  size: 40,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Icon(Icons.person, color: AppColors.brown, size: 40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
