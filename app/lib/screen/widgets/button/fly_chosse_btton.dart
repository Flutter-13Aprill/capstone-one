import 'package:app/extension/Screen/get_size_screen.dart';
import 'package:app/screen/flight_result_screen.dart';
import 'package:app/theme/style_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FlyChosseBtton extends StatefulWidget {
  final String title;
  final Function()? onPressed;

  FlyChosseBtton({super.key, required this.title, this.onPressed});

  @override
  State<FlyChosseBtton> createState() => _FlyChosseBtton();
}

class _FlyChosseBtton extends State<FlyChosseBtton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Margin applied to the left and top of the button
      margin: EdgeInsets.only(left: 46, top: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          16,
        ), // Rounded corners for the button
        color: StyleColor.promaryBlueColor, // Background color of the button
      ),
      width:
          context.getWidth() * .8, // Sets the width to 80% of the screen width
      child: MaterialButton(
        onPressed: () {
          if (widget.onPressed != null) {
            widget.onPressed!();
          }
        },

        child: Text(
          // Localized text for the button
          "${widget.title}".tr(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
