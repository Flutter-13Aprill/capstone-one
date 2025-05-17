import 'package:app/extension/Screen/get_size_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChaneLangaugeButton extends StatefulWidget {
  ChaneLangaugeButton({super.key, required this.pageToGo, this.userLangauge});
  final Widget pageToGo; // The page to navigate to after changing the language
  final userLangauge; // The current user's language code (e.g., "ar", "en")
  @override
  State<ChaneLangaugeButton> createState() => _ChaneLangaugeButton();
}

class _ChaneLangaugeButton extends State<ChaneLangaugeButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16), // Margin around the button container
      width:
          context.getWidth() * .8, // Sets the width to 80% of the screen width

      child: Container(
        margin: EdgeInsets.only(top: 10), // Top margin for the inner container
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ), // Rounded corners for the button
        child: MaterialButton(
          color:
              Theme.of(context)
                  .buttonTheme
                  .colorScheme
                  ?.primary, // Background color from the theme's button color scheme
          minWidth:
              Theme.of(context)
                  .buttonTheme
                  .minWidth, // Minimum width from the theme's button theme
          height:
              Theme.of(
                context,
              ).buttonTheme.height, // Height from the theme's button theme

          // Called when the button is pressed
          onPressed: () {
            // If the user's language is Arabic, set the locale to English (US)
            if (widget.userLangauge == "ar") {
              context.setLocale(Locale('ar', 'AR'));
            } else {
              context.setLocale(Locale('en', 'US'));
            } // Navigate to the specified page after changing the language
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => widget.pageToGo),
            );
          },
          child: Text(// Applies the 'titleSmall' text style from the current theme
            "chooselanguage".tr(),
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ),
    );
  }
}
