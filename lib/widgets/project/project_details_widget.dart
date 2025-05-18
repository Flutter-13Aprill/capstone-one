import 'package:flutter/material.dart';

import 'package:project_flow/style/my_style.dart';
import 'package:project_flow/utils/extensions/screen_size.dart';
import 'package:project_flow/widgets/appbar_container_icon_wideget.dart';
import 'package:project_flow/widgets/project/chart_project_widget.dart';
import 'package:project_flow/widgets/task_cart_widget.dart';

class ProjectDetailsWidget extends StatelessWidget {
  ProjectDetailsWidget({super.key, required this.project});
  final project;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        leading: AppbarContainerIconWideget(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          isLeading: true,

          onTap: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StyleApp.sizeH16,
            Container(
              alignment: Alignment.center,
              width: context.getWight(pre: 0.70),
              height: context.getHight(pre: 0.40),
              child: ChartProjectWidget(project: project),
            ),
          
            StyleApp.sizeH24,

            Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),

                children: [
                  ...project.task.map((task) {
                    return TaskCartWidget(task: task);
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
