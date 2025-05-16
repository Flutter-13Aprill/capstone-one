import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskins_stress_relief_app/themes/styles/app_colors.dart';
import 'package:taskins_stress_relief_app/themes/styles/app_fonts.dart';
import 'package:taskins_stress_relief_app/themes/theme_manager.dart';

class MoodTracerScreen extends StatefulWidget {
  const MoodTracerScreen({super.key});

  @override
  State<MoodTracerScreen> createState() => _MoodTracerScreen();
}

class _MoodTracerScreen extends State<MoodTracerScreen> {
    List<Map<String, String>> moodDataList = [];
    final Map<String, String> moodMessages = {
  "lib/assets/images/happy_no_paw.png": "You were happy at",
  "lib/assets/images/sad.png": "You were sad at",
  "lib/assets/images/angry.png": "You were angry at",
  "lib/assets/images/loving_no_paw.png": "You were feeling loving at",
  "lib/assets/images/nervous.png": "You were nervous at",
  "lib/assets/images/wonder_eye_no_paw.png": "You were curious at",
};


    
      @override
  void initState() {
    super.initState();
    _loadMoods();
  }

  Future<void> _addMood(String imagePath, String date) async {
  final prefs = await SharedPreferences.getInstance();
  List<String> moodData = prefs.getStringList('moodData') ?? [];
  moodData.add("$imagePath|$date|Feeling good!");
  await prefs.setStringList('moodData', moodData);
}


Future<void> _loadMoods() async {
  final prefs = await SharedPreferences.getInstance();
  
  // Don't reset the moods every time
  final moodData = prefs.getStringList('moodData') ?? [];
  
  setState(() {
    moodDataList = moodData.map((entry) {
      final parts = entry.split('|');
      return {
        'imagePath': parts[0],
        'date': parts[1],
        'message': parts[2],
      };
    }).toList();
  });
}





  @override
  Widget build(BuildContext context) {
      final themeManager = Provider.of<ThemeManager>(context);
    return Scaffold(
      appBar: AppBar(
                leading: IconButton(onPressed: (){
          Navigator.popAndPushNamed(context, '/explore');
        }, icon:Icon(Icons.arrow_back_ios, color: AppColors.reddishBrown)),
        elevation: 0,
         backgroundColor: themeManager.themeMode == ThemeMode.dark
          ? AppColors.darkOrange
          : AppColors.lightOrange,
        actions: [
         
        ],
      ),
  backgroundColor: themeManager.themeMode == ThemeMode.dark
          ? AppColors.darkOrange
          : AppColors.lightOrange,
body: Stack(children: [
         Column(
            children: [
                SizedBox(height: 16),
              Container(
               width: 430,
                height: 806,
                decoration: BoxDecoration(
                  color: themeManager.themeMode == ThemeMode.dark
          ? AppColors.darkCream
          : AppColors.cream,
                   borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                ),
                  border: Border(
                    top: BorderSide(
              color: Color(0xFF8C3117),
              width: 4,
                    ),
                    left: BorderSide(
              color: Color(0xFF8C3117),
              width: 4,
                    ),
                    right: BorderSide(
              color: Color(0xFF8C3117),
              width: 4,
                    ),
                    
                ),
                ),
              
                child: Column( children: [
                   SizedBox(height: 32),
Text("Mood Tracker", style: AppFonts.fontSizeTwo,),
   SizedBox(height: 32),
Expanded(
  child: moodDataList.isEmpty
      ? const Center(
          child: Text("No moods added yet."),
        )
      : GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, // Only 1 card per row
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 3, // Make the cards wider
          ),
          itemCount: moodDataList.length,
          itemBuilder: (context, index) {
            final mood = moodDataList[index];
            return Container(
              decoration: BoxDecoration(
                color: AppColors.cream,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.reddishBrown, width: 2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
  children: [
    Image.asset(mood['imagePath']!, width: 100, height: 100),
    const SizedBox(width: 16),
    Flexible(
      child: Text(
        "${moodMessages[mood['imagePath']] ?? 'You were feeling something at'} ${mood['date']}",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.reddishBrown,
        ),
      ),
    ),
  ],
),

                  ],
                ),
              ),
            );
          },
        ),
)






                ]),

            )
            ]),



        
      ],)

    );
  }
}