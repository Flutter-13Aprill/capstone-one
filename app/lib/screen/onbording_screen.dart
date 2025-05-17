import 'package:app/extension/Screen/get_size_screen.dart';
import 'package:flutter/material.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // Stack widget to overlap widgets.
        clipBehavior: Clip.none,// Allows children to overflow the Stack.
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),// Allows children to overflow the Stack.
            width: context.getWidth(),// Set width & height to screen width using extension.
            height: context.getHeigth(),
            child: Image.asset("assets/images/2.png", fit: BoxFit.fill),// Display an image, filling the container.
          ),
          Positioned(            // Positioned widget to place the text at a specific location.
            top: 650,// Position from the top.
            left: 50,// Position from the left.
            child: Text(
              "Fly Like a Bird",
              style: Theme.of(context).textTheme.titleLarge,// Apply titleLarge text style from the theme.
            ),
          ),
          Positioned(
            left: 36,
            bottom: 100,
            child: Text(
              style: Theme.of(context).textTheme.titleSmall,
              "Explore new world with us and let\n yourself get an amazing experiences",
            ),
          ),
        ],
      ),
    );
  }
}
