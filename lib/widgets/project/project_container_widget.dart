import 'package:flutter/material.dart';
import 'package:project_flow/controllers/project_view_controller.dart';
import 'package:project_flow/models/project.dart';
import 'package:project_flow/utils/extensions/screen_size.dart';
import 'package:project_flow/widgets/avatar_stack.dart';

class ProjectContainerWidget extends StatelessWidget {
  const ProjectContainerWidget(
      {super.key, required this.project, required this.controller});
  final Project project;
  final ProjectViewController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      height: context.getHight(pre: 0.14),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        border: Border.all(
          color: Theme.of(context).dividerColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  project.title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  project.status.name,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                AvatarStack(imagePaths: controller.getTeamImages(project)),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: context.getWight(pre: 0.35),
              height: 10,
              child: LinearProgressIndicator(
                value: project.completedTask / project.totalTask,
                backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                color: Theme.of(context).primaryColor,
                minHeight: 6,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Text(
              "${project.completedTask}/${project.totalTask}",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
