import 'package:blood_donation/theems/color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BildCity extends StatefulWidget {
  const BildCity({
    super.key,
    required this.selected,
    required this.oncityselect,
  });
  final String selected;
  final Function(String) oncityselect;
  @override
  State<BildCity> createState() => _BildCityState();
}

class _BildCityState extends State<BildCity> {
  @override
  Widget build(BuildContext context) {
    final cities = ["All".tr(), "riyadh".tr(), "jeddah".tr(), "Qassim".tr()];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:
          cities.map((city) {
            final isSelected = widget.selected == city;
            return ChoiceChip(
              backgroundColor: myAppColor.graycolor,
              label: Text(
                city,
                style: TextStyle(
                  color: isSelected ? myAppColor.whitecolor : Colors.black,
                ),
              ),
              selected: isSelected,
              selectedColor: myAppColor.redcolor,
              onSelected: (_) => widget.oncityselect(city),
            );
          }).toList(),
    );
  }
}
