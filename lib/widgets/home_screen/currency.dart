import 'package:flutter/material.dart';

// -- Controllers
import 'package:shabah/controllers/determine_cost.dart';
import 'package:easy_localization/easy_localization.dart';

// -- External Package
import 'package:flutter_svg/svg.dart';
// -- App Theming
import 'package:shabah/style/app_colors.dart';

class Currency extends StatelessWidget {

  /// [Currency] is used to displays the final cost of a service along with the currency symbol (SAR).
  /// The layout adapts based on the current locale language:
  /// - For English (LTR), shows the currency symbol first, then the amount.
  /// - For other locales (e.g., Arabic RTL), shows the amount first, then the currency symbol.
  ///
  /// Uses DetermineCost controller to calculate the cost dynamically based on the selected service and number of people.
  const Currency({super.key,required this.serviceIndex,required this.numberOfPeopleIndex,});

  final int serviceIndex;
  final int numberOfPeopleIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      children:
          context.locale.languageCode == 'en'  ?
              [
                SvgPicture.asset('assets/home_screen/home_screen_svgs/SAR.svg'),
                Text(
                  DetermineCost.getFinalCost(
                    indexOfService: serviceIndex,
                    NumberOfPeople: numberOfPeopleIndex,
                  ).toString(),
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
              ]
              : 
              [
                Text(
                  DetermineCost.getFinalCost(
                    indexOfService: serviceIndex,
                    NumberOfPeople: numberOfPeopleIndex,
                  ).toString(),
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
                SvgPicture.asset('assets/home_screen/home_screen_svgs/SAR.svg'),
              ],
    );
  }
}
