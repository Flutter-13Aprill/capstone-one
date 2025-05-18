import 'package:flutter/material.dart';

class CategoryTabs extends StatefulWidget {
  CategoryTabs({
    super.key,
    required this.categoryIndex,
    required this.categoryName,
    required this.selectedTabIndex,
  });

  final String categoryName;
  final int categoryIndex;
  int selectedTabIndex;

  @override
  State<CategoryTabs> createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
      ),
      child: Text(
        widget.categoryName,
        style: TextStyle(
          color:
              widget.selectedTabIndex == widget.categoryIndex
                  ? Colors.white
                  : Colors.grey,
          fontSize: 16,
        ),
      ),
    );
  }
}
