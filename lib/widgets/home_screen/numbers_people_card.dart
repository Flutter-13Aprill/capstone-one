import 'package:flutter/material.dart';

// Extensions
import 'package:shabah/style/app_colors.dart';

// -- App Theming
import 'package:shabah/extensions/screen_size.dart';

class NumbersPeopleCard extends StatelessWidget {

  /// A card widget representing a selectable number of people option.
  ///
  /// Highlights itself with a white background, shadow, and colored icon/text
  /// when selected; otherwise, it shows a gray background with white icon/text.
  ///
  /// - [numberOfPeople]: The number displayed on the card.
  /// - [uniqueIndex]: The index of this card instance.
  /// - [selectedIndex]: The currently selected card index to determine styling.
  const NumbersPeopleCard({super.key,required this.numberOfPeople,required this.uniqueIndex,required this.selectedIndex,});

  final int numberOfPeople;
  final int uniqueIndex;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: context.getHeight(multiplied: 0.09),
      height: context.getHeight(multiplied: 0.07),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: uniqueIndex == selectedIndex ? Colors.white : Color.fromRGBO(188, 182, 182, 1),
        borderRadius: BorderRadius.circular(8),
        boxShadow: uniqueIndex == selectedIndex ? [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.3),
            offset: Offset(0, 8),
            blurRadius: 4,
          ),
        ] : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/home_screen/home_screen_images/People.png',
            color: uniqueIndex == selectedIndex ? AppColors.secondaryColor : Colors.white,
          ),
          Text(numberOfPeople.toString(), style: TextStyle(fontWeight: uniqueIndex == selectedIndex ? FontWeight.bold : FontWeight.normal, color: uniqueIndex == selectedIndex ? AppColors.secondaryColor : Colors.white)),
        ],
      ),
    );
  }
}
