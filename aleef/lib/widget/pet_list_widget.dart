import 'package:flutter/material.dart';

class PetListWidget extends StatelessWidget {
  /// A widget that represents a single task item in the pet's task list.
  /// Displays a checkbox, task title, and a delete button.
  const PetListWidget({
    super.key,
    required this.tileColor,
    required this.tasks,
    required this.onChanged,
    required this.onPressed,
    required this.task,
    required this.isDone,
  });

  /// Callback when delete button is pressed
  final Function()? onPressed;

  /// Callback when the checkbox value changes
  final Function(bool?)? onChanged;

  /// Complete list of tasks (not used here directly)
  final Map<String, bool> tasks;

  /// Color for the tile background
  final Color tileColor;

  /// The task title
  final String task;

  /// Completion status of the task
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: tileColor,
        // Checkbox on the left
        leading: Checkbox(value: isDone, onChanged: onChanged),
        // Task title
        title: Text(task, style: Theme.of(context).textTheme.bodyLarge),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        // Delete button on the right
        trailing: IconButton(onPressed: onPressed, icon: Icon(Icons.delete)),
      ),
    );
  }
}
