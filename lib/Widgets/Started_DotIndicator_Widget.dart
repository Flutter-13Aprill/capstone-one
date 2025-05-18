import 'package:flutter/material.dart';

class StartedDotIndicatorWidget extends StatelessWidget {
  final bool isActive; // Flag to determine if the dot is active

  // Constructor to initialize the widget with the active state
  const StartedDotIndicatorWidget({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250), // Duration for the animation effect
      width: isActive ? 22 : 8, // Width changes based on active state
      height: 8, // Height is constant
      decoration: BoxDecoration(
        gradient: isActive // Active state shows a gradient
            ? LinearGradient(
                colors: [Color(0xFFBFA0FF), Color(0xFF836FFF)],
              )
            : null, // No gradient for inactive state
        color: isActive ? null : Colors.grey[600], // Grey color when inactive
        borderRadius: BorderRadius.circular(12), // Rounded corners for the dot
      ),
    );
  }
}
