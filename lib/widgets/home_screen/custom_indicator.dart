import 'package:flutter/material.dart';

// -- App Theming
import 'package:shabah/style/app_colors.dart';

class CustomIndicator extends StatelessWidget {
  
  /// [CustomIndicator] a custom tab indicator widget that displays the service name with
  /// a colored underline indicator beneath it.
  ///
  /// The text style and underline color change based on whether the tab is selected.
  /// The underline's border radius adapts based on the current tab index to
  /// create a smooth rounded effect on the active tab.
  ///
  /// - [serviceName]: The label text for the tab.
  /// - [index]: The index of this tab.
  /// - [tabBarIndex]: The currently selected tab index.
  
  const CustomIndicator({super.key,required this.serviceName,required this.index,required this.tabBarIndex,});
  final String serviceName;
  final int tabBarIndex;
  final int index;

  BorderRadiusGeometry get getBorderRadius {
    switch (tabBarIndex) {
      case 0:
        return BorderRadius.only(topRight: Radius.circular(12));

      case 1:
        return BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        );

      case 2:
        return BorderRadius.only(topLeft: Radius.circular(12));
      default:
        return BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          serviceName,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
            color: index == tabBarIndex ? AppColors.tertiaryColor : AppColors.labelText,
            fontSize: index == tabBarIndex ? 22 : 20,
          ),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 100),
          curve: Curves.easeInOut,
          height: 4,
          width: index == 1 ? 110 : 90,
          decoration: BoxDecoration(
            borderRadius: getBorderRadius,
            color: index == tabBarIndex ? AppColors.tertiaryColor : Colors.transparent,
          ),
        ),
      ],
    );
  }
}
