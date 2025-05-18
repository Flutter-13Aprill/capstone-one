import 'dart:convert';
import 'package:aleef/controller/care_routine_controller.dart';
import 'package:aleef/main.dart';
import 'package:aleef/widget/add_pet.dart';
import 'package:aleef/widget/care_drawer.dart';
import 'package:aleef/widget/list_header.dart';
import 'package:aleef/widget/pet_list_widget.dart';
import 'package:aleef/widget/title_care_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CareRoutineScreen extends StatefulWidget {
  /// This screen allows users to manage their pet care routines
  const CareRoutineScreen({super.key});

  @override
  State<CareRoutineScreen> createState() => _CareRoutineScreenState();
}

class _CareRoutineScreenState extends State<CareRoutineScreen> {
  // Controllers for input fields
  final TextEditingController petNameController = TextEditingController();
  final TextEditingController taskController = TextEditingController();
  // Controller to manage care routine logic
  CareRoutineController careRoutineController = CareRoutineController();
  // Stores task text and its completion state
  Map<String, bool> tasks = {};
  // Dropdown items for pet types
  final List<String> item = [
    'cat'.tr(),
    'dog'.tr(),
    'fish'.tr(),
    'rabbit'.tr(),
  ];
  // Selected pet type from dropdown
  String? selectedValue = 'cat'.tr();
  // Stored pet name
  String? petName;

  @override
  void initState() {
    super.initState();
    // Load stored pet name and tasks from shared preferences
    getTasks();
  }

  /// Load tasks and name from local storage
  void getTasks() {
    petName = prefs.getString('petName');
    String? encodedMap = prefs.getString('tasks');
    if (encodedMap != null) {
      setState(() {
        tasks = Map<String, bool>.from(json.decode(encodedMap));
      });
    }
  }

  /// Save pet name and tasks to local storage
  void setTasks() {
    prefs.setString('petName', petNameController.text);
    String encodedMap = json.encode(tasks);
    prefs.setString('tasks', encodedMap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Navigation drawer with user info
      drawer: CareDrawer(
        accountName: prefs.getString('name') ?? 'User',
        accountEmail: prefs.getString('email') ?? 'Email not set',
      ),
      // App bar with title
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(200),
          child: TitleCareWidget(titleName: prefs.getString('name') ?? 'User'),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Builder(
              builder: (context) {
                // If no pet name is stored, show pet creation UI
                if (petName == null || petName!.isEmpty) {
                  return Column(
                    children: [
                      Text(
                        'noPetAdded'.tr(),
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      AddPet(
                        onChanged: (item) {
                          selectedValue = item;
                          setState(() {});
                        },
                        onTab: () {
                          // Save pet name and refresh UI
                          petName = careRoutineController.savePetName(
                            petNameController,
                          );
                          setState(() {});
                          Navigator.pop(context);
                          petNameController.clear();
                        },
                        item: item,
                        selectedValue: selectedValue,
                        petNameController: petNameController,
                      ),
                    ],
                  );
                } else {
                  // If pet exists, show task management UI
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListHeader(
                          taskController: taskController,
                          petName: petName!,
                          onAddPressed: () {
                            // Add task using controller
                            careRoutineController.addTask(
                              taskController,
                              tasks,
                            );
                            setState(() {});
                            setTasks(); // Save tasks
                            taskController.clear();
                            Navigator.of(context).pop(); // Close modal
                          },
                          onRemovePressed: () {
                            // Remove all stored data
                            prefs.remove('petName');
                            prefs.remove('tasks');
                            setState(() {
                              petName = null;
                              tasks.clear();
                            });
                          },
                        ),
                      ),
                      // List of tasks
                      Expanded(
                        child: ListView.builder(
                          itemCount: tasks.length,
                          itemBuilder: (context, index) {
                            String task = tasks.keys.elementAt(index);
                            bool isDone = tasks[task]!;
                            return PetListWidget(
                              tileColor: careRoutineController.colorChange(
                                isDone,
                              ),
                              tasks: tasks,
                              onChanged: (value) {
                                setState(() {
                                  careRoutineController.checkbox(
                                    tasks,
                                    task,
                                    value!,
                                  );
                                });
                              },
                              onPressed: () {
                                careRoutineController.removeTask(tasks, task);
                                setTasks();
                                setState(() {});
                              },
                              task: task,
                              isDone: isDone,
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
