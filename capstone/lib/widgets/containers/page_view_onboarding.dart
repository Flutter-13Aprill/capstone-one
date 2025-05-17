import 'package:capstone/extensions/size.dart';
import 'package:flutter/material.dart';

class PageViewOnboarding extends StatelessWidget {
  const PageViewOnboarding({
    super.key,
    required this.setImage,
    required this.setText,
  });

// onboarding screen with image and text setters
  final String setImage;
  final String setText;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        width: context.getWidth() * 0.586,
        height: context.getHieght() * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: context.getHieght() * 0.2,

              child: Image.asset(setImage,),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Text(setText, textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}
