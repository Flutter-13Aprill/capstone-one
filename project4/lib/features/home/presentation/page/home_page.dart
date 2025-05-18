import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project4/core/controller/image_picker_controller.dart';
import 'package:project4/core/theme/app_palette.dart';
import 'package:project4/features/home/presentation/widget/custom_shimmer.dart';
import 'package:project4/features/home/presentation/widget/drawer_list_tile.dart';
import 'package:project4/features/home/presentation/widget/receipt_grade_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  final imagePickerController = ImagePickerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: AppPalette.background1,
                    radius: 50,
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: AppPalette.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
            DrawerListTile(),
          ],
        ),
      ),
      body:
          isLoading
              ? CustomShimmer()
              : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SearchBar(hintText: "Search", leading: Icon(Icons.search)),
                    const SizedBox(height: 10),
                    Flexible(child: ReceiptGradeView()),
                  ],
                ),
              ),
    );
  }
}
