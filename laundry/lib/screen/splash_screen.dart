import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:async';

import 'package:laundry/screen/view_page.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 7), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (__) => ViewPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        // toolbarHeight: 200, //to resize the app bar
      ),
      body: Column(
        children: [
          SizedBox(height: 130),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Lottie.asset(
                "assets/lottie/logo.json",
                // height: 200,
                // width: 200,
              ),
            ),
          ),
          Text(
            "Laundry",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
