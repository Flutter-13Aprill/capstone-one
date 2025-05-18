import 'package:coffee/style/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
  width: MediaQuery.sizeOf(context).width * 0.8,
  height: 50,
  decoration: BoxDecoration(
    color: AppColors.ongray,
    borderRadius: BorderRadius.circular(15),
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      children: [
        Icon(Icons.search, color: AppColors.white), 
        SizedBox(width: 8),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'search coffee'.tr(),
              hintStyle: TextStyle(
                color: AppColors.lightGray,
                fontSize: 20,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
        ),
      ],
    ),
  ),
);
  }
}