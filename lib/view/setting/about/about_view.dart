import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_flow/style/my_style.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('about.title'.tr()),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              maxRadius: 80,
              backgroundColor: Theme.of(context).primaryColor,
              child: Image.asset(width: 70, "assets/splash_logo.png"),
            ),
            StyleApp.sizeH24,
            Text(
              'about.t1'.tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            StyleApp.sizeH16,
            Text(
              'about.t2'.tr(),
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ),
    );
  }
}
