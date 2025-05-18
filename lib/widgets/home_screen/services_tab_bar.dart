import 'package:flutter/material.dart';

// -- Widgets 
import 'package:shabah/widgets/home_screen/custom_indicator.dart';

// -- Controllers
import 'package:shabah/controllers/service_controller.dart';

// -- External Package 
import 'package:easy_localization/easy_localization.dart';

// -- Extensions 
import 'package:shabah/extensions/screen_size.dart';

// -- App Theming
import 'package:shabah/style/app_colors.dart';

class ServicesTabBar extends StatefulWidget {

  const ServicesTabBar({super.key,required this.controller,required this.tabBarIndex,this.onTap,});

  final TabController controller;
  final int tabBarIndex;
  final void Function(int?)? onTap;

  @override
  State<ServicesTabBar> createState() => _ServicesTabBarState();
}

class _ServicesTabBarState extends State<ServicesTabBar> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: widget.controller,
      onTap: widget.onTap,
      indicatorAnimation: TabIndicatorAnimation.linear,
      indicatorSize: TabBarIndicatorSize.tab,
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      padding: EdgeInsets.zero,
      indicatorPadding: EdgeInsets.zero,
      labelPadding: context.locale.languageCode == 'en' ? EdgeInsets.only(right: context.getHeight(multiplied: 0.1)) : EdgeInsets.only(left: context.getHeight(multiplied: 0.1)),
      dividerColor: Colors.transparent,
      indicatorColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      labelColor: AppColors.secondaryColor,
      unselectedLabelColor: AppColors.labelText,
      tabs: [

        CustomIndicator(
          serviceName: ServiceController.firstServiceName,
          index: 0,
          tabBarIndex: widget.tabBarIndex,
        ),
        CustomIndicator(
          serviceName: ServiceController.secondServiceName,
          index: 1,
          tabBarIndex: widget.tabBarIndex,
        ),
        CustomIndicator(
          serviceName: ServiceController.thirdServiceName,
          index: 2,
          tabBarIndex: widget.tabBarIndex,
        ),
      ],
    );
  }
}
