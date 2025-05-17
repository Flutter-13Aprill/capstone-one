import 'package:app/extension/Screen/get_size_screen.dart';
import 'package:app/main.dart';
import 'package:app/theme/style_color.dart';
import 'package:flutter/material.dart';

// Defines a StatelessWidget called ContainerPassenger

class ContainerPassenger extends StatelessWidget {
  final Widget
  child; // Declares a final Widget child that will be contained within this container

  ContainerPassenger({
    super.key,
    required this.child,
  }); // Constructor for the ContainerPassenger widget, requires a child widget

  @override
  Widget build(BuildContext context) {
    return Container(
      // Adds margin around the container
      margin: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
      width:
          context
              .getWidth(), // Sets the width of the container to the screen width using a custom extension
      height:
          context.getHeigth() *
          .07, // Sets the height of the container to 7% of the screen height using a custom extension
      decoration: BoxDecoration(
        // Sets the height of the container to 7% of the screen height using a custom extension
        borderRadius: BorderRadius.circular(
          10,
        ), // Sets the border of the container based on the current theme's darkness
        border:
            !isDarkThem
                ? Border.all(color: Theme.of(context).colorScheme.primary)
                : Border.all(color: Theme.of(context).colorScheme.secondary),
      ), // Places the provided child widget inside this container

      child: child,
    );
  }
}
