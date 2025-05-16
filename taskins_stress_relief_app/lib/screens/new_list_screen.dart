import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskins_stress_relief_app/functions/subtask_generator.dart';
import 'package:taskins_stress_relief_app/screens/sub_list_screen.dart';
import 'package:taskins_stress_relief_app/themes/styles/app_colors.dart';
import 'package:taskins_stress_relief_app/themes/styles/app_fonts.dart';
import 'package:taskins_stress_relief_app/themes/theme_manager.dart';

class NewListScreen extends StatefulWidget {
  const NewListScreen({super.key});

  @override
  State<NewListScreen> createState() => _NewListScreenState();
}

class _NewListScreenState extends State<NewListScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController taskController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  void generateAndGoToSublist() async {
  final task = taskController.text.trim();

  if (task.isNotEmpty) {
    setState(() {
      isLoading = true;
    });

    try {
      final subtasks = await generateSubtasks(task);
      setState(() {
        isLoading = false;
      });

      if (subtasks.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubListScreen(subtasks: subtasks),
          ),
        );
      } else {
        print("No subtasks generated");
      }
    } catch (e) {
      print("Error generating subtasks: $e");
      setState(() {
        isLoading = false;
      });
    }
  }
}


  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final isDarkMode = themeManager.themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: isDarkMode ? AppColors.darkOrange : AppColors.lightOrange,
        leading: IconButton(
          onPressed: () => Navigator.popAndPushNamed(context, '/explore'),
          icon: Icon(Icons.arrow_back_ios, color: AppColors.reddishBrown),
        ),
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
                      const SizedBox(height: 48),
                      Center(
                        child: Text(
                          "What is your main Task?",
                          style: AppFonts.fontSizeThree,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          const SizedBox(width: 8),
                          Icon(Icons.info, color: AppColors.reddishBrown),
                          const SizedBox(width: 10),
                          Text(
                            "Add a broad task, like 'Plan a party'",
                            style: AppFonts.fontSizeSix,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Form(
                        key: _formKey,
                        child: Container(
                          width: 380,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.lavender,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: AppColors.reddishBrown,
                              width: 3,
                            ),
                          ),
                          child: TextFormField(
                            controller: taskController,
                            decoration: InputDecoration(
                            
                             
                           
                              border: InputBorder.none,
                              
                              ),
                            ),
                          ),
                    
                        ),
                  
            
                      const SizedBox(height: 60),
                      Center(
                    
                        
                          child: ElevatedButton(
                            onPressed: isLoading ? null : generateAndGoToSublist,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.pink,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                              side: BorderSide(
                                color: AppColors.reddishBrown,
                                width: 3,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                               
                              ),
                            ),
                            child: isLoading
                                ? const CircularProgressIndicator(color: Colors.white)
                                : const Text("Next", style: AppFonts.fontSizeFive,),
                          ),
                      
                      ),
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
