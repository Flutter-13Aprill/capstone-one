import 'package:flutter/material.dart';
import 'package:sawan_app/core/theme/app_palette.dart';

class CustomTapBarr extends StatelessWidget {
  const CustomTapBarr({
    super.key,
    required this.length,
    required this.dataModel,
  });
  final int length;
  final List<dynamic> dataModel;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: length,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: TabBar(
          isScrollable: true,
          dividerHeight: 0,
          indicator: BoxDecoration(
            color: AppPalette.primeryColorBlue,
            borderRadius: BorderRadius.circular(36),
          ),
          labelColor: AppPalette.primeryColorWhite,
          unselectedLabelColor: AppPalette.primeryColorBlue,
          indicatorPadding: EdgeInsets.zero,
          labelPadding: const EdgeInsets.symmetric(horizontal: 4),
          tabs: List.generate(length, (index) {
            return Tab(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppPalette.primeryColorBlue,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(36),
                ),
                child: Text(dataModel[index].title),
              ),
            );
          }),
        ),
      ),
    );
  }
}
