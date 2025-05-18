import 'package:flutter/material.dart';
import 'package:project_flow/view/home_view.dart';
import 'package:project_flow/view/project_view/project_view.dart';

class BottomnavController {

   static int currentPageIndex = 0;
  final List<Widget> children = [
    HomeView(),
    ProjectView()
  ];

}