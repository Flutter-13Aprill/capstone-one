import 'package:flutter/material.dart';

class TaskCompletionProvider extends ChangeNotifier {
  List<bool> isCheckedList = [];

  void initializeTasks(int taskCount) {
    isCheckedList = List.generate(taskCount, (index) => false);
  }

  void toggleTask(int index) {
    isCheckedList[index] = !isCheckedList[index];
    notifyListeners();
  }

  bool areAllTasksCompleted() {
    return isCheckedList.isNotEmpty && isCheckedList.every((checked) => checked);
  }
}
