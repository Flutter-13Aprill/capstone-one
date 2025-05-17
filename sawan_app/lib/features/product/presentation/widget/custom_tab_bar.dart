import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sawan_app/core/theme/app_palette.dart';
import 'package:sawan_app/features/product/data/tab_bar_product_model.dart';

class CustomTapBar extends StatefulWidget {
  const CustomTapBar({super.key});

  @override
  State<CustomTapBar> createState() => _CustomTapBarState();
}

class _CustomTapBarState extends State<CustomTapBar> {
  late final List<TabBarProductModel> tabs;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tabs = getTabData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
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
          tabs:
              tabs
                  .map(
                    (i) => Tab(
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
                        child: Text(i.titleKey.tr()),
                      ),
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }
}
