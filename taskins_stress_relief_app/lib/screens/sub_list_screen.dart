import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskins_stress_relief_app/screens/home_screen.dart';
import 'package:taskins_stress_relief_app/screens/sub_task_list_view.dart';

import 'package:taskins_stress_relief_app/themes/styles/app_colors.dart';
import 'package:taskins_stress_relief_app/themes/styles/app_fonts.dart';
import 'package:taskins_stress_relief_app/themes/theme_manager.dart';
import 'package:taskins_stress_relief_app/widgets/nav_bar.dart';

class SubListScreen extends StatefulWidget {
  final List<String> subtasks;
  const SubListScreen({super.key, required this.subtasks});

  @override
  State<SubListScreen> createState() => _SubListScreenState();
}

class _SubListScreenState extends State<SubListScreen> {
  late List<String> subtasks;
  final TextEditingController _taskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    subtasks = widget.subtasks;
  }

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  void _addSubtask(String task) {
    setState(() {
      subtasks.add(task.trim());
    });
    _taskController.clear();
  }

  void _removeSubtask(int index) {
    setState(() {
      subtasks.removeAt(index);
    });
  }
 


  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final isDarkMode = themeManager.themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.popAndPushNamed(context, '/explore'),
          icon: Icon(Icons.arrow_back_ios, color: AppColors.reddishBrown),
        ),
        elevation: 0,
        backgroundColor: isDarkMode ? AppColors.darkOrange : AppColors.lightOrange,
      ),
      backgroundColor: isDarkMode ? AppColors.darkOrange : AppColors.lightOrange,
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 120),
              Container(
                width: 430,
                height: 703,
                decoration: BoxDecoration(
                  color: isDarkMode ? AppColors.darkCream : AppColors.cream,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  border: Border.all(
                    color: const Color(0xFF8C3117),
                    width: 4,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 28,),
                      Text("What do you need to get done?", style:AppFonts.fontSizeFour),
                       SizedBox(height: 28,),
                     Text("Add more items:", style:AppFonts.fontSizeFive),
                      const SizedBox(height: 16),
                      Container(
                        height: 210,
                        width: 378,  // Set a fixed height for the scrollable area
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppColors.reddishBrown,
                            width: 3,
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: subtasks.map((task) {
                              final index = subtasks.indexOf(task);
                              return Chip(
                                label: Text(
                                  task,
                                
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    
                                  ),
                                  
                                ),
                                backgroundColor: AppColors.green,
                                  shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                                 ),
                                deleteIcon: const Icon(Icons.close, size: 16, color: Colors.black),
                                onDeleted: () => _removeSubtask(index),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),
                      Padding(
                        padding: const EdgeInsets.only(left:0, right:6),
                        child: TextField(
                          controller: _taskController,
                          onSubmitted: (task) {
                            if (task.isNotEmpty) {
                              _addSubtask(task);
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Add more items ",
                            filled: true,
                            fillColor: AppColors.white,
                            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: AppColors.reddishBrown, width: 3),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: AppColors.reddishBrown, width: 3),
                            ),
                          
                          ),
                        ),
                        
                      ),
                       const SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: _completeSubtasks,
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: AppColors.reddishBrown,
            //     padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 60),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //   ),
            //   child: const Text("Done", style: TextStyle(fontSize: 18, color: Colors.white)),
            // ),
            const SizedBox(height: 30),
    Center(
      child: Container(
        width:300,
        height:60,
        child: ElevatedButton(
          onPressed: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => NavBar(initialSubtasks: subtasks),
          ),
          (route) => false, // Remove all previous routes
        );
          },
          style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.pink,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: AppColors.reddishBrown,
          width: 3)
        ),
          ), 
          child: const Text("Activate List", style: AppFonts.fontSizeFour),
        ),
      ),
    )



  
                    ],
                  ),
                ),
              ),
              
            ],
            
          ),
           Positioned(
        top:30,
        left: 40,
        child: 
      Image.asset(
                "lib/assets/images/amazing_cat.png",
                cacheWidth: 600,
              ),
      
      ),
        ],
      ),
    );
  }
}

