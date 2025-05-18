import 'package:flutter/material.dart';
import 'package:project_flow/Theme/app_colors.dart';
import 'package:project_flow/models/task.dart';
import 'package:project_flow/utils/extensions/screen_size.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:project_flow/widgets/shimmer/shimmer_task_card.dart';

class TaskCartWidget extends StatefulWidget {
  const TaskCartWidget({super.key, required this.task});
  final Task task;

  @override
  State<TaskCartWidget> createState() => _TaskCartWidgetState();
}

class _TaskCartWidgetState extends State<TaskCartWidget> {
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
    return isLoading ? ShimmerTaskCard() : _buildActualCard(context);
  }

  Widget _buildActualCard(BuildContext context) {
    return InkWell(
  onTap: () {
    // TODO: add details view task [show comments]
  },
  child: Container(
    padding: const EdgeInsets.all(8),
    margin: const EdgeInsets.all(8),
    height: context.getHight(pre: 0.16),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.border, width: 2),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Center(
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              title: Text(
                widget.task.title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
              ),
              subtitle: Text(
                widget.task.description,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textHint,
                      fontSize: 16,
                    ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Text(
                widget.task.label.name,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
            ),
          ),
          CircularPercentIndicator(
            radius: 40.0,
            lineWidth: 8.0,
            percent: widget.task.percentage,
            center: Text(
              "${(widget.task.percentage * 100).toStringAsFixed(0)}%",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            progressColor: AppColors.success,
            backgroundColor: AppColors.border,
            circularStrokeCap: CircularStrokeCap.round,
          ),
        ],
      ),
    ),
  ),
);

  }
}
