import 'package:aleef/style/style_color.dart';
import 'package:flutter/material.dart';

/// A controller that manages logic for pet care routines
class CareRoutineController {
  /// Returns a color depending on whether the task is completed.
  Color colorChange(bool isDone) {
    return isDone ? Colors.grey.shade400 : StyleColor.mist;
  }

  /// Updates the checkbox value for a specific task and returns the new value.
  bool checkbox(Map<String, bool> tasks, String task, bool value) {
    return tasks[task] = value;
  }

  /// Removes a task from the task list.
  removeTask(Map<String, bool> tasks, String task) {
    tasks.remove(task);
  }

  /// Saves and returns a pet name if it's not empty.
  /// Returns null if the input is empty.
  String? savePetName(TextEditingController petNameController) {
    return petNameController.text.trim().isEmpty
        ? null
        : petNameController.text;
  }

  /// Adds a new task to the task map if it's not empty.
  /// Returns false as initial state if added, null if input is invalid.
  bool? addTask(TextEditingController taskController, Map<String, bool> tasks) {
    if (taskController.text.trim().isEmpty) {
      return null;
    } else {
      return tasks[taskController.text.trim()] = false;
    }
  }
}
