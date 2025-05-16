import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';
import 'package:taskins_stress_relief_app/screens/sub_task_list_view.dart';
import 'package:taskins_stress_relief_app/themes/styles/app_colors.dart';
import 'package:taskins_stress_relief_app/themes/styles/app_fonts.dart';
import 'package:taskins_stress_relief_app/widgets/sub_task_tab_tile.dart';

class CustomTabBar extends StatefulWidget {
   
  final List<String> initialSubtasks;
  late TabController tabController;
    final VoidCallback onAllTasksCompleted;

     

  CustomTabBar({super.key, required this.tabController, required this.initialSubtasks, required this.onAllTasksCompleted, });
 

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> with SingleTickerProviderStateMixin {
   int currentIndex = 0;
  List<String> subtasks = [];
    late List<Map<String, dynamic>> subtasksWithStatus;
  late ConfettiController _controllerTopCenter;




  @override
  void initState() {
    super.initState();
    subtasks = widget.initialSubtasks;
     // Initialize the subtasks
       subtasksWithStatus = widget.initialSubtasks.map((subtask) {
      return {
        'title': subtask,
        'isChecked': false,
      };
    }).toList();
       _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 10));

  }
    @override
  void dispose() {
   _controllerTopCenter.dispose();
    super.dispose();
  }

  void _toggleCheckbox(int index) {
  setState(() {
    subtasksWithStatus[index]['isChecked'] = !subtasksWithStatus[index]['isChecked'];

    // Only play confetti, don't navigate
    if (_areAllTasksCompleted()) {
      _controllerTopCenter.play();  // Play confetti
    }
  });
}


bool _areAllTasksCompleted() {
  return subtasksWithStatus.isNotEmpty && subtasksWithStatus.every((task) => task['isChecked']);
}



  
Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Tab Bar
        TabBar(
          controller: widget.tabController,
          indicator: const BoxDecoration(color: Colors.transparent),
          labelPadding: const EdgeInsets.symmetric(horizontal: 2),
          tabs: List.generate(3, (index) {
            bool isSelected = widget.tabController.index == index;
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.reddishBrown : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xFF8C3117), width: 2),
              ),
              child: Center(
                child: Text(
                  index == 0 ? "active".tr() : index == 1 ? "pending".tr() : "saved".tr(),
                  style: TextStyle(
                    color: isSelected ? Colors.white : Color(0xFF8C3117),
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            );
          }),
        ),

        // Tab Bar View
        // Tab Bar View
Expanded(
  child: TabBarView(
    controller: widget.tabController,
    children: [
      // **First Tab - Subtasks with Checkboxes**
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
Expanded(
  child: subtasksWithStatus.isEmpty
      ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/newlist');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: AppColors.reddishBrown),
                    const SizedBox(width: 8),
                    Text("add_new_list".tr(), style: AppFonts.fontSizeFiveDark),
                  ],
                ),
              ),
            ],
          ),
        )
      : ListView.builder(
          itemCount: subtasksWithStatus.length,
          itemBuilder: (context, index) {
            final task = subtasksWithStatus[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 0,
              child: CheckboxListTile(
                title: Text(
                  task['title'],
                  style: task['isChecked']
                      ? AppFonts.fontSizeFive.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        )
                      : AppFonts.fontSizeFive,
                ),
                value: task['isChecked'],
                activeColor: AppColors.reddishBrown,
                onChanged: (bool? value) {
                  _toggleCheckbox(index);
                },
              ),
            );
          },
        ),
),

               IgnorePointer(
          ignoring: true,
          child: Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _controllerTopCenter,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              colors: [AppColors.reddishBrown, Colors.orange, Colors.green, Colors.blue, Colors.purple],
              createParticlePath: drawStar,
              numberOfParticles: 20,
              
            ),
          ),
        ),
            const SizedBox(height: 20),
           Row(children: [ Center(
              child: // BUTTON SOULD BE HERE ,
   Center(
  child: Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(23),
    border: Border.all(
      color: _areAllTasksCompleted() ? AppColors.reddishBrown : Colors.grey,
      width: 3,
    ),
  ),
  child: ElevatedButton(
    onPressed: _areAllTasksCompleted()
        ? () {
            setState(() {
              subtasksWithStatus.clear();  // Clear the tasks
              _controllerTopCenter.stop();  // Stop the confetti
            });
            Navigator.pushNamed(context, '/rewards');  // Navigate to reward page
          }
        : null,
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: _areAllTasksCompleted() ? AppColors.pink : Colors.grey.shade300,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    child: Text(
      "claim_reward".tr(),
      style: TextStyle(
        color: _areAllTasksCompleted() ? AppColors.reddishBrown : Colors.grey.shade500,
        fontSize: 18,
      ),
    ),
  ),
),

),
            ),
            SizedBox(width: 40),
          GestureDetector(
  onTap: () {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "share_list".tr(),
                style: AppFonts.fontSizeFiveDark.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: AppColors.reddishBrown,
                ),
              ),
              const SizedBox(height: 15),
              ListTile(
                leading: Icon(Icons.link, color: AppColors.reddishBrown),
                title: Text("copy_shareable_link".tr(), style: AppFonts.fontSizeFiveDark),
                onTap: () {
                  // Add your copy link logic here
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.email, color: AppColors.reddishBrown),
                title: Text("Share via Email", style: AppFonts.fontSizeFiveDark),
                onTap: () {
                  // Add your email sharing logic here
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.share, color: AppColors.reddishBrown),
                title: Text("Share via Social Media", style: AppFonts.fontSizeFiveDark),
                onTap: () {
                  // Add your social media sharing logic here
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  },
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.share, color: AppColors.reddishBrown),
      const SizedBox(width: 8),
      Text("share_list".tr(), style: AppFonts.fontSizeFiveDark),
    ],
  ),
),

              ],
              )
          ],
        ),
      ),
      
      // **Second Tab - Placeholder**
      Center(
        child: Text(
          "No pending tasks!",
          style: TextStyle(fontSize: 18, color: Colors.grey.shade500),
        ),
      ),
      
      // **Third Tab - Placeholder**
      Center(
        child: Text(
          "No saved tasks!",
          style: TextStyle(fontSize: 18, color: Colors.grey.shade500),
        ),
      ),
    ],
  ),
),
 
        
      
   
    
      ],
      );
    
  }
}
    



