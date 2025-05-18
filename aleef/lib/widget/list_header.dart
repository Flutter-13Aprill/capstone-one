import 'package:aleef/style/style_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ListHeader extends StatelessWidget {
  /// A custom header for a list of pet tasks with add and remove options.
  const ListHeader({
    super.key,
    required this.taskController,
    required this.petName,
    required this.onAddPressed,
    required this.onRemovePressed,
  });

  /// Controller for the task input field
  final TextEditingController taskController;

  /// Displayed pet name
  final String petName;

  /// Callback when the "Add" button is pressed
  final Function()? onAddPressed;

  /// Callback when the "Delete" icon is pressed
  final Function()? onRemovePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            IconButton(
              onPressed:
                  // Add Task Button with Dialog
                  () => showDialog<String>(
                    context: context,
                    builder:
                        (BuildContext context) => AlertDialog(
                          backgroundColor: Colors.grey.shade300,
                          title: Text('addTask'.tr()),
                          // Input field for task
                          content: TextField(
                            controller: taskController,
                            decoration: InputDecoration(
                              hintText: "enterTask".tr(),
                              labelText: "task".tr(),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                          // Action buttons
                          actions: <Widget>[
                            TextButton(
                              onPressed: onAddPressed,
                              child: Text('add'.tr()),
                            ),
                          ],
                        ),
                  ),

              icon: Icon(Icons.add_box, size: 30),
            ),
            // Pet Name
            Text(petName, style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
        // Delete icon for removing task or pet
        IconButton(
          icon: Icon(Icons.delete, color: StyleColor.coral, size: 30),
          onPressed: onRemovePressed,
        ),
      ],
    );
  }
}
