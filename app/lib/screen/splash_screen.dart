import 'dart:async';

import 'package:app/extension/Screen/get_size_screen.dart';
import 'package:app/screen/choose_language.dart';
import 'package:app/screen/onbording_screen.dart';
import 'package:app/screen/page_view_screen.dart.dart';
import 'package:app/theme/style_color.dart';
import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;
  @override //set timer to go next page
  void initState() {
    timer = Timer.periodic(Duration(seconds: 10), (timer) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PageViewScreen()),
      );
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //set backgroundColor
      backgroundColor: StyleColor.promaryBlueColor,
      appBar: AppBar(
        backgroundColor: StyleColor.promaryBlueColor,
      ), //set backgroundColor of AppBar
      //make WidgetAnimator effect  when start 
      body: WidgetAnimator(
        //incomingSlideInFromBottom
        incomingEffect: WidgetTransitionEffects.incomingSlideInFromTop(),
        child: Container(// Container for holding image 
          width: context.getHeigth(),//define width &height
          height: context.getHeigth(),

          child: Image.asset("assets/images/1.png"),
        ),
      ),
    );
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    timer!.cancel();//cancel timer
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer!.cancel();//cancel timer

  }
}

 