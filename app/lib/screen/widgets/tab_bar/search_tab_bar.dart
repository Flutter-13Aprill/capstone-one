import 'package:app/extension/Screen/get_size_screen.dart';
import 'package:app/screen/one_way_screen.dart';
import 'package:app/screen/round_trip_screen.dart';
import 'package:app/screen/widgets/dropdown_menu/cityies_dropdown_menu.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SearchTabBar extends StatefulWidget {
  const SearchTabBar({super.key});

  @override
  State<SearchTabBar> createState() => _SearchTabBarState();
}

class _SearchTabBarState extends State<SearchTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // Manages the state for a TabBar and its associated TabBarView.
      length: 2, // Number of tabs.
      initialIndex: 0, // Number of tabs.
      child: Column(
        // Arranges widgets vertically.
        children: [
          // Tab bar with localized text.
          TabBar(tabs: [Tab(text: "oneway".tr()), Tab(text: "roundtrip".tr())]),
          SizedBox(
            // Provides a sized space.
            width: context.getWidth(), // Provides a sized space.

            height: context.getHeigth() * 0.745, // 74.5% of the screen height.
            child: TabBarView(
              children: [OneWayScreen(), RoundTripScreen()],
            ), // 74.5% of the screen height.
          ),
        ],
      ),
    );
  }
}
