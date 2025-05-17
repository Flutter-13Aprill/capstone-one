import 'package:capstone/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class FilterChipList extends StatefulWidget {
  const FilterChipList({super.key});

  @override
  State<FilterChipList> createState() => _FilterChipListState();
}

class _FilterChipListState extends State<FilterChipList> {
  final List<String> filters = [
    "filter_all",
    "filter_nearby",
    "filter_free",
    "filter_discounted",
  ];

  String selectedFilter = "filter_all";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final key = filters[index];
          final isSelected = key == selectedFilter;

          return ChoiceChip(
            label: Text(key.tr()),
            selected: isSelected,
            onSelected: (_) {
              setState(() {
                selectedFilter = key;
              });
            },
            selectedColor: AppColors.primaryRed,
            backgroundColor: Colors.grey[200],
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide.none,
            ),
          );
        },
      ),
    );
  }
}
