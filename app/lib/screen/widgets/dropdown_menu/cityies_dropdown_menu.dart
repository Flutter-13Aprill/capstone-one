import 'package:app/theme/style_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CityiesDropdownMenu extends StatefulWidget {
  // Key for the location (e.g., "Departure City", "Arrival City"), used for translation
  final String whereLocationKey;
  final Function(String)? onCitySelected; // retrun value chossen frm user
  // Callback function that returns the selected city as a String
  CityiesDropdownMenu({
    // Constructor for the CityiesDropdownMenu widget
    super.key,
    required this.whereLocationKey,
    this.onCitySelected,
  });

  @override
  State<CityiesDropdownMenu> createState() => _CityiesDropdownMenuState();
}

class _CityiesDropdownMenuState extends State<CityiesDropdownMenu> {
  // Constructor for the CityiesDropdownMenu widget

  List primarySecondBlueColor = [
    "Riyadh".tr(),
    "Jeddah".tr(),
    "Dubai".tr(),
    "Tokyo".tr(),
    "Moscow".tr(),
    "Doha".tr(),
    "Kuwait City".tr(),
    "Vienna".tr(),
    "Los Angeles".tr(),
    "Beijing".tr(),
    "Seoul".tr(),
    "San Francisco".tr(),
  ];
  String selectedItem =
      "Riyadh".tr(); // Constructor for the CityiesDropdownMenu widget
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        Container(
          //continer to display citeis that user can chose from it
          padding: EdgeInsets.only(left: 16), // add padding
          decoration: BoxDecoration(
            border: Border.all(
              //make  border
              color: StyleColor.promarySecondBlueColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(16), //rounded
          ),
          margin: EdgeInsets.symmetric(horizontal: 15), //add margin
          //make a drop doumn meanu
          child: DropdownButtonFormField(
            decoration: InputDecoration(
              // Label for the dropdown, translated using the provided key
              label: Text("${widget.whereLocationKey}".tr()),
              labelStyle: //stylle it
                  Theme.of(
                    context,
                  ).dropdownMenuTheme.inputDecorationTheme!.labelStyle,
              border: InputBorder.none,
            ),
            onChanged: (value) {
              setState(() {
                selectedItem = value.toString();
                widget.onCitySelected!(
                  // Label for the dropdown, translated using the provided key
                  selectedItem,
                );
              });
            },
            value: selectedItem, // Currently selected value of the dropdown
            items:
                primarySecondBlueColor // Items to display in the dropdown, generated from the list of cities
                    .map(
                      (item) =>
                          DropdownMenuItem(value: item, child: Text(item)),
                    )
                    .toList(),//makeit as list
          ),
        ),
      ],
    );
  }
}
