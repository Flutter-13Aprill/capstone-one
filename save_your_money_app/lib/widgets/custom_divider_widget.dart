import 'package:flutter/material.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({super.key});
  // A thin horizontal divider line with a custom gray color for subtle separation between UI elements.

  @override
  Widget build(BuildContext context) {
    return Container(height: 0.8, color: Colors.grey[700]);
  }
}
