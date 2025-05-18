import 'package:coffee/widget/botton_design.dart';
import 'package:flutter/material.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({super.key, required this.lable, required this.screen, required this.width});
  final String lable;
  final Widget screen;
  final double width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: BottonDesign(lable: lable, width: width), // i make 2 diffrent bottom, one to just design and other to navegating (its help me in validation text field)
    );
  }
}
