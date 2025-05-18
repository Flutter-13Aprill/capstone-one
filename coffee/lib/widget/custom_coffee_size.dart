// import 'package:coffee/style/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCoffeeSize extends StatelessWidget {
  const CustomCoffeeSize({
    super.key,
    required this.size,
    required this.box,
    required this.border, this.textColor,
  });
  final String size;
  final Color box;
  final Color border;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 50,
      decoration: BoxDecoration(
        color: box,
        border: Border.all(color: border, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(child: Text(size, style: TextStyle(color: textColor))),
    );
  }
}
