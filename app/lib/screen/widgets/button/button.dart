import 'package:app/extension/Screen/get_size_screen.dart';
import 'package:app/screen/flight_result_screen.dart';
import 'package:app/theme/style_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
    // final Widget pageToGo; // This was likely intended for navigation

  final String title;
  final Function()? onPressed;  // final Widget pageToGo; // This was likely intended for navigation

  Button({
    super.key,
    required this.title,// The text displayed on the button
    this.onPressed,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16), // Rounded corners for the button
        color: StyleColor.promaryBlueColor,// Background color of the button
      ),
      width: context.getWidth() * .8,// Sets the width to 80% of the screen width
      child: MaterialButton(// Calls the provided onPressed callback when tapped
        onPressed: widget.onPressed,
        
        child: Text( // Displays the localized title of the button
          "${widget.title}".tr(),
          style: Theme.of(context).textTheme.titleSmall,// Applies the 'titleSmall' text style from the current theme
        ),
      ),
    );
  }
}
