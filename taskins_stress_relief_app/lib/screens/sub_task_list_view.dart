import 'package:flutter/material.dart';
import 'package:taskins_stress_relief_app/themes/styles/app_colors.dart';

class SubtaskListWidget extends StatefulWidget {
  final List<String> subtasks;
  final Function(int) onDelete;
  final Function(bool) onTaskCompleted;

  const SubtaskListWidget({
    super.key,
    required this.subtasks,
    required this.onDelete,
    required this.onTaskCompleted,
  });

  @override
  State<SubtaskListWidget> createState() => _SubtaskListWidgetState();
}

class _SubtaskListWidgetState extends State<SubtaskListWidget> {
  late List<bool> isCheckedList;

  @override
  void initState() {
    super.initState();
    isCheckedList = List.generate(widget.subtasks.length, (index) => false);
  }

  void _toggleCheckbox(int index) {
    setState(() {
      isCheckedList[index] = !isCheckedList[index];

      // Check if all tasks are completed
      bool allCompleted = isCheckedList.every((checked) => checked);
      widget.onTaskCompleted(allCompleted);
    });
  }

  bool _areAllTasksChecked() {
    return isCheckedList.every((checked) => checked);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.darkGreen,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.reddishBrown, width: 2),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: widget.subtasks.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: isCheckedList[index],
                  onChanged: (value) {
                    _toggleCheckbox(index);
                  },
                  title: Text(
                    widget.subtasks[index],
                    style: TextStyle(
                      fontSize: 18,
                      decoration: isCheckedList[index] ? TextDecoration.lineThrough : null,
                      color: isCheckedList[index] ? Colors.grey : AppColors.reddishBrown,
                    ),
                  ),
                  secondary: IconButton(
                    icon: const Icon(Icons.close, color: Colors.black),
                    onPressed: () => widget.onDelete(index),
                  ),
                  activeColor: AppColors.reddishBrown,
                  checkColor: Colors.white,
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            onPressed: _areAllTasksChecked()
                ? () {
                    Navigator.pushNamed(context, '/rewards');
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: _areAllTasksChecked() ? AppColors.reddishBrown : Colors.grey[300],
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              "Finish",
              style: TextStyle(
                color: _areAllTasksChecked() ? Colors.white : Colors.grey[600],
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}








