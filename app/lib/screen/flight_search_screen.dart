import 'package:app/screen/widgets/tab_bar/search_tab_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FlightSearchScreen extends StatelessWidget {
  const FlightSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FlightSearchScreen".tr())),
         //call SearchTabBar
      body: ListView(children: [SearchTabBar()]),
    );
  }
}
