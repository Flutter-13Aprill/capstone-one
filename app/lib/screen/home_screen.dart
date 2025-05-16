 import 'package:app/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("home"),

          Row(
            children: [
              Icon(Icons.home),
              Text('name'.tr()),
              ElevatedButton(
                onPressed: () {
                  if (context.locale.languageCode == "en") {
                    context.setLocale(Locale('ar', 'AR'));
                  } else {
                    context.setLocale(Locale('en', 'US'));
                  }
                },
                child: Text("chane lan"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
