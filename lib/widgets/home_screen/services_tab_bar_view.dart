import 'package:flutter/material.dart';

// -- Widget
import 'package:shabah/widgets/home_screen/service_section.dart';
// -- Controller
import 'package:shabah/controllers/service_controller.dart';

class ServicesTabBarView extends StatelessWidget {
  const ServicesTabBarView({super.key, required this.controller});

  final TabController controller;

  @override
  Widget build(BuildContext context) {

    return TabBarView(
      controller: controller,
      children: [
        ServiceSection(
          nameService: ServiceController.firstServiceName,
          title: ServiceController.firstServiceTitle,
          subtitle: ServiceController.firstServiceSubtitle,
          listOfIncludedServices: ServiceController.firstService,
          serviceIndex: 0,
        ),
        ServiceSection(
          nameService: ServiceController.secondServiceName,
          title: ServiceController.secondServiceTitle,
          subtitle: ServiceController.secondServiceSubtitle,
          listOfIncludedServices: ServiceController.secondService,
          serviceIndex: 1,
        ),
        ServiceSection(
          nameService: ServiceController.thirdServiceName,
          title: ServiceController.thirdServiceTitle,
          subtitle: ServiceController.thirdSubtitle,
          listOfIncludedServices: ServiceController.thirdService,
          serviceIndex: 2,
        ),
      ],
    );
  }
}
