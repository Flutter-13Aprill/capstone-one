import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riyadh_transportation/screen/favorite_screen.dart';
import 'package:riyadh_transportation/screen/map_screen.dart';
import 'package:riyadh_transportation/screen/search_Screen.dart';
import 'package:riyadh_transportation/style/app_colors.dart';
import 'package:riyadh_transportation/widget/drawer/drawer_widget.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

int currentIndex = 0;

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    List screen = [FavoriteScreen(), MapScreen(), SearchScreen()];
    List<AppBar> appbar = [
      AppBar(
        centerTitle: true,
        title: Text("favorite").tr(),
        backgroundColor: Color(0xfff0f0f0),
      ),
      AppBar(
        centerTitle: true,
        title: Text("Map").tr(),
        backgroundColor: Color(0xfff0f0f0),
      ),
      AppBar(
        centerTitle: true,
        title: Text("Search").tr(),
        backgroundColor: Color(0xfff0f0f0),
      ),
    ];

    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: AppColors.primary,
        items: <Widget>[
          Icon(Icons.favorite, size: 30),
          Icon(Icons.map_outlined, size: 30),
          Icon(Icons.search, size: 30),
        ],
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
      ),
      appBar: appbar[currentIndex],
      drawer: Drawer(child: DrawerWidget()),
      body: screen[currentIndex],
    );
  }
}
