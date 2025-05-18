import 'package:flutter/material.dart';
import 'package:project_flow/Theme/app_colors.dart';
import 'package:project_flow/models/project.dart';
import 'package:project_flow/widgets/avatar_stack.dart';
import 'package:project_flow/widgets/project/project_details_widget.dart';
import 'package:project_flow/widgets/shimmer/shimmer_project_card.dart'; // New import

class ProjectCardWidget extends StatefulWidget {
  final Project project;
  final bool isActive;

  const ProjectCardWidget({
    super.key,
    required this.project,
    required this.isActive,
  });

  @override
  State<ProjectCardWidget> createState() => _ProjectCardWidgetState();
}

class _ProjectCardWidgetState extends State<ProjectCardWidget> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? ShimmerProjectCard(isActive: widget.isActive)
        : _buildActualCard(context);
  }

  Widget _buildActualCard(BuildContext context) {
    final avatarPaths =
        widget.project.team.map((user) => user.avatar).take(4).toList();

    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ProjectDetailsWidget(project: widget.project),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: widget.isActive
              ? LinearGradient(
                  colors: Theme.of(context).brightness == Brightness.dark
                      ? [
                          AppColors.primaryDarkDarkMode,
                          AppColors.deepPurpleDarkMode
                        ]
                      : [AppColors.primaryDark, AppColors.deepPurple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: widget.isActive ? null : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
              blurRadius: widget.isActive ? 12 : 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(21),
        width: 260,
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.project.title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: widget.isActive
                        ? AppColors.surface
                        : Theme.of(context).textTheme.titleMedium?.color,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.project.subTitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 12,
                    color: widget.isActive
                        ? AppColors.surface
                        : Theme.of(context).textTheme.bodySmall?.color,
                  ),
            ),
            const Spacer(),
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.info,
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 18),
                ),
                AvatarStack(imagePaths: avatarPaths),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Progress",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 12,
                              color: widget.isActive
                                  ? AppColors.surface
                                  : Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.color,
                            ),
                      ),
                      const SizedBox(height: 4),
                      LinearProgressIndicator(
                        value: widget.project.completedTask /
                            widget.project.totalTask,
                        backgroundColor: Theme.of(context).dividerColor,
                        color: AppColors.primary,
                        minHeight: 6,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  "${widget.project.completedTask}/${widget.project.totalTask}",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 12,
                        color: widget.isActive
                            ? AppColors.surface
                            : Theme.of(context).textTheme.bodySmall?.color,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
