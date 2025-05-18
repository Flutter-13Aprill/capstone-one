import 'package:aleef/style/style_color.dart';
import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  /// A horizontal line with width based on the given button text.
  const Line({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(width: 30, height: 1, color: StyleColor.clay);
  }
}
