import 'package:flutter/material.dart';

Widget buildTextWidget(
  String text,
  double fontSize,
  Color? color, {
  bool isBold = false,
}) {
  return Center(
    child: Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    ),
  );
}
