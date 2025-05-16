import 'package:app/controllar/choose_language_contollar.dart';
import 'package:app/extension/Screen/get_size_screen.dart';
import 'package:app/screen/bottom_navigation_bar_screen.dart';
import 'package:app/screen/login_screen.dart';
import 'package:app/screen/widgets/button/button.dart';
import 'package:app/screen/widgets/button/change_langauge_button.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ChooseLanguage extends StatefulWidget {
  const ChooseLanguage({super.key});

  @override
  State<ChooseLanguage> createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  ChooseLanguageContollar languageContollar = ChooseLanguageContollar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: context.getWidth(), // Full screen width.
            height: context.getHeigth() * .35, // 35% of the screen height
            child: Stack(
              // Allows widgets to be positioned on top of each other.
              clipBehavior:
                  Clip.none, // Allows children to overflow the stack bounds.
              children: [
                Positioned(
                  // Positions a child within the Stack.
                  top: -9, // Slightly offset from the top.
                  child: Container(
                    width: context.getWidth(), // Slightly offset from the top.
                    height:
                        context.getHeigth() * .35, // 35% of the screen height.
                    child: ClipRRect(
                      // Clips its child using a rounded rectangle.
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Image.asset(
                        "assets/images/riyadh.jpg", // Displays an image from assets.
                        fit:
                            BoxFit
                                .cover, // Makes the image cover the entire container
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16), // Vertical spacing.
          Text(
            "choose language".tr(), // Localized text for "choose language".
            style: Theme.of(context).textTheme.headlineLarge, // style it
            textAlign: TextAlign.center, // Centers the text horizontally.
          ),
          Padding(
            padding: EdgeInsets.only(
              top: context.getHeigth() * .002,
            ), // Centers the text horizontally.
            child: RadioListTile(
              title: Text(
                "English", // Text for the English option.
                style:
                    Theme.of(
                      context,
                    ).textTheme.headlineLarge, // Large headline text style.
              ),

              value: "en", // Value associated with this radio button.
              groupValue: languageContollar.userLangauge, // The currently selected language.
              onChanged: (value) {
                // Callback when this radio button is selected.
                setState(() {
                  languageContollar.userLangauge = value!; // Update the selected language.
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: context.getHeigth() * .002, // Small top padding.
              bottom: context.getHeigth() * .002, // Small bottom padding.
            ),
            child: RadioListTile(
              title: Text(
                "العربية", // Text for the Arabic option
                style:
                    Theme.of(
                      context,
                    ).textTheme.headlineLarge, // Text for the Arabic option
              ),

              value: "ar", // Value associated with this radio button.
              groupValue: languageContollar.userLangauge, // The currently selected language.
              onChanged: (value) {
                // Callback when this radio button is selected.
                setState(() {
                  languageContollar.userLangauge = value!; // Update the selected language.
                });
              },
            ),
          ),

          ChaneLangaugeButton(
            pageToGo:
                LoginScreen(), // The screen to navigate to after choosing language.
            userLangauge: languageContollar.userLangauge, // The selected user language.s
          ),
        ],
      ),
    );
  }
}
