import 'package:flutter/material.dart';
import 'package:sawan_app/features/onbording/presentation/widget/custom_page_view.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [Flexible(child: CustomPageView())]),
    );
  }
}
