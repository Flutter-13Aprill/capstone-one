import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_flow/controllers/project_view_controller.dart';
import 'package:project_flow/models/project.dart';
import 'package:project_flow/widgets/appbar_container_icon_wideget.dart';
import 'package:project_flow/widgets/bottom%20sheet/showBlurredBottomSheet.dart';

import 'package:project_flow/widgets/labels_widget.dart';
import 'package:project_flow/widgets/project/project_container_widget.dart';

class ProjectView extends StatelessWidget {
  ProjectView({super.key});
  final Set<Status> labels = Status.values.toSet();
  final ProjectViewController controller = ProjectViewController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    centerTitle: true,
    backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
    leading: AppbarContainerIconWideget(
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
      isLeading: true,
      onTap: () => Navigator.pop(context),
    ),
    actions: [
      AppbarContainerIconWideget(
        size: 35,
        icon: const Icon(Icons.add),
        onTap: () {
          showBlurredBottomSheet(context);
        },
      ),
    ],
    title: Text(
      "project.titleView".tr(),
      style: Theme.of(context).appBarTheme.titleTextStyle,
    ),
  ),
  body: SafeArea(
    child: Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 16),
      alignment: Alignment.center,
      child: Column(
        children: [
          SearchBar(
            leading: Image.asset(width: 24, "assets/project/search.png"),
            hintText: "project.search".tr(),
            elevation: WidgetStateProperty.all(0),
            backgroundColor: WidgetStateProperty.all(
              Theme.of(context).canvasColor,
            ),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).dividerColor,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          LabelsWidget(labels: labels),
          Expanded(
            child: ListView.builder(
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return ProjectContainerWidget(
                  project: projects[index],
                  controller: controller,
                );
              },
            ),
          ),
        ],
      ),
    ),
  ),
);

  }
}
