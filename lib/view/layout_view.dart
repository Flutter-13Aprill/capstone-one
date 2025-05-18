import 'package:flutter/material.dart';
import 'package:project_flow/Theme/app_colors.dart';
import 'package:project_flow/controllers/bottomNav_controller.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:project_flow/view/home_view.dart';
import 'package:project_flow/view/profile/profile_view.dart';
import 'package:project_flow/view/project_view/project_view.dart';
import 'package:project_flow/view/setting/setting_view.dart';

class LayoutView extends StatefulWidget {
  LayoutView({super.key});
  BottomnavController navCotroller = BottomnavController();
  List<Widget> widgetOptions = [
    HomeView(),
    ProjectView(),
    ProfileView(),
    SettingView()
  ];

  @override
  State<LayoutView> createState() => _BottomnavWidgetState();
}

class _BottomnavWidgetState extends State<LayoutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  bottomNavigationBar: CurvedNavigationBar(
    backgroundColor:Theme.of(context).brightness != Brightness.dark? AppColors.primaryDark: AppColors.textSecondary,
    color: Theme.of(context).canvasColor,
    buttonBackgroundColor: Theme.of(context).cardColor,
    height: 60,
    items: <Widget>[
      Icon(Icons.home, size: 30, color: Theme.of(context).iconTheme.color),
      Image.asset(
        "assets/home/Folder.png",
        width: 30,
        height: 30,
        color: Theme.of(context).iconTheme.color, 
      ),
      Icon(Icons.person, size: 30, color: Theme.of(context).iconTheme.color),
      Icon(Icons.settings, size: 30, color: Theme.of(context).iconTheme.color),
    ],
    onTap: (index) {
      BottomnavController.currentPageIndex = index;
      setState(() {});
    },
  ),
  body: widget.widgetOptions[BottomnavController.currentPageIndex],
);

  }
}
