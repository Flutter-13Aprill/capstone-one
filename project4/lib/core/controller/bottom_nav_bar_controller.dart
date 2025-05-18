import 'package:flutter/material.dart';
import 'package:project4/features/home/presentation/page/home_page.dart';
import 'package:project4/features/receipt/presentation/page/receipt_page.dart';
import 'package:project4/features/settings/presentation/page/settings_page.dart';

class BottomNavBarController {
  int selected = 0;
  // navigationBar(int currentIndex) {
  //   selected = currentIndex;
  // }

  final List<Widget> page = [HomePage(), ReceiptPage(), SettingsPage()];

  //   IconData changeSvgColor(){
  //
  //  }
}
