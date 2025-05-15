import 'package:capstone1/Helpers/screen_extinsion.dart';
import 'package:capstone1/Styling/colors.dart';
import 'package:flutter/material.dart';

class WhiteContainer extends StatefulWidget {
  const WhiteContainer({super.key, this.child});
  final Widget? child;

  @override
  State<WhiteContainer> createState() => _WhiteContainerState();
}

class _WhiteContainerState extends State<WhiteContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.75,
      width: context.screenWidth,
      decoration: BoxDecoration(
        color: backgroundGreenwhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(context.screenHeight * 0.06),
          topRight: Radius.circular(context.screenHeight * 0.06),
        ),
      ),
      child: widget.child,
    );
  }
}
