import 'package:app/screen/choose_language.dart';
import 'package:app/screen/onbording_screen.dart';
import 'package:flutter/material.dart';
//import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreen();
}

class _PageViewScreen extends State<PageViewScreen> {
  PageController pageController = PageController(); // Controller for the PageView widget.
  List<Widget> pages = [OnbordingScreen(),ChooseLanguage()]; // Controller for the PageView widget.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       // Controller for the PageView widget  & Provides the list of pages to display.
      body: PageView(controller: pageController, children: pages),
    );
  }
    @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    pageController.dispose();// Disposes of the page controller when the widget is deactivated.
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();// Disposes of the page controller when the widget is deactivated.
  }
}
