
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskins_stress_relief_app/screens/new_list_screen.dart';
import 'package:taskins_stress_relief_app/themes/styles/app_colors.dart';
import 'package:taskins_stress_relief_app/themes/styles/app_fonts.dart';
import 'package:taskins_stress_relief_app/themes/theme_manager.dart';
import 'package:taskins_stress_relief_app/widgets/tab_bar.dart';
class HomeScreen extends StatefulWidget {
   final List<String> initialSubtasks;
  const HomeScreen({super.key, required this.initialSubtasks,});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
      late TabController tabController;
  late List<String> activeSubtasks;

late List<String> subtasks;

@override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
     activeSubtasks = widget.initialSubtasks;
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

 void _addNewList() async {
    final newSubtasks = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NewListScreen()),
    );

    if (newSubtasks != null && newSubtasks.isNotEmpty) {
      setState(() {
        activeSubtasks.addAll(newSubtasks);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    return Scaffold(
      appBar: AppBar(

elevation: 0,
backgroundColor:  themeManager.themeMode == ThemeMode.dark
          ? AppColors.darkOrange
          : AppColors.lightOrange,
leading: Padding(
  padding: const EdgeInsets.only(left:12.0),
  child: Image.asset("lib/assets/images/profile.png"),
),
title: Row(
  children: [
    Text("hello_saja".tr(), style: AppFonts.fontSizeFour,),
  ],
), 
actions: [

  Padding(
    padding: const EdgeInsets.only(right:20.0),
    child: Builder(
      builder: (context) => IconButton(
        onPressed: (){
          Scaffold.of(context).openDrawer();
        }, icon: Icon(Icons.menu, color: AppColors.reddishBrown,
        ),
        ),
      
    ),
  ),

],   
    ),
      drawer: Drawer(
        backgroundColor: themeManager.themeMode == ThemeMode.dark
          ? AppColors.darkCream
          : AppColors.cream,
       child: ListView(children: [
        DrawerHeader(child: Text("menu".tr(), style: AppFonts.fontSizeThree)),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/notification');
          },
          child: ListTile(
            leading: Icon(Icons.notifications, color: AppColors.reddishBrown),
            title:Text("notifications".tr(), style: AppFonts.fontSizeSix,),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/settings');
          },
          child: ListTile(
            leading: Icon(Icons.settings, color: AppColors.reddishBrown),
            title:Text("settings".tr(), style: AppFonts.fontSizeSix,),
          ),
        ),
        ListTile(
          leading: Icon(Icons.logout_rounded, color: AppColors.reddishBrown),
          title:Text("logout".tr(), style: AppFonts.fontSizeSix,),
        ),
       ],)
      ),
      backgroundColor:   themeManager.themeMode == ThemeMode.dark
          ? AppColors.darkOrange
          : AppColors.lightOrange,
      body: Stack(children: [
         Column(
            children: [
                SizedBox(height: 120),
              Container(
               width: 430,
                height: 590,
                decoration: BoxDecoration(
                  color:   themeManager.themeMode == ThemeMode.dark
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
                   SizedBox(height: 48),
Row(
  children: [
     SizedBox(width: 18),
    Text("how_do_you_feel_today".tr(), style: AppFonts.fontSizeFour),
  ],

),
 SizedBox(height: 16),
Row(
  children: [
    SizedBox(width: 16),
    _buildCatMoodButton(context, "lib/assets/images/wonder_eye_no_paw.png",  "you_are_feeling_curious".tr(), "Do you want to add that to your mood tracker"),
    _buildCatMoodButton(context, "lib/assets/images/angry.png",  "you_are_feeling_angry".tr(), "Do you want to add that to your mood tracker"),
    _buildCatMoodButton(context, "lib/assets/images/nervous.png",  "you_are_feeling_nervous".tr(), "Do you want to add that to your mood tracker"),
    _buildCatMoodButton(context, "lib/assets/images/loving_no_paw.png", "you_are_feeling_loving".tr(),"Do you want to add that to your mood tracker"),
    _buildCatMoodButton(context, "lib/assets/images/sad.png", "you_are_feeling_sad".tr(),"Do you want to add that to your mood tracker"),
   _buildCatMoodButton(context, "lib/assets/images/happy_no_paw.png", "do_you_want_to_add_to_mood_tracker".tr(), "Do you want to add that to your mood tracker"),
  ],
),
SizedBox(height: 32),
Expanded(child: Padding(
  padding: const EdgeInsets.only(left:16.0, right: 16,),
  child: CustomTabBar(
  tabController: tabController,
  initialSubtasks: activeSubtasks,
  onAllTasksCompleted: () {
  
  },
)

)


),





                ]),

            )
            
            ]),
 Positioned(
        top:30,
        left: 40,
        child: 
      Image.asset(
                "lib/assets/images/amazing_cat.png",
                cacheWidth: 600,
              ),
      
      ),


        
      ],)
    );
  }
}
Widget _buildCatMoodButton(BuildContext context, String imagePath, String dialogTitle, String dialogMessage) {
  final TextEditingController messageController = TextEditingController();

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: MaterialButton(
      onPressed: () {
        showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            return Container(
              child: CupertinoAlertDialog(
                title: Text(dialogTitle, style: AppFonts.fontSizeFive,),
                content: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(dialogMessage, style: AppFonts.fontSizeSix,),
                    ),
                    const SizedBox(height: 12),
                  
                  ],
                ),
                actions: [
                  CupertinoDialogAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("cancel".tr(), style: AppFonts.fontSizeSix,),
                  ),
                  CupertinoDialogAction(
  onPressed: () async {
    final prefs = await SharedPreferences.getInstance();
    List<String> moodData = prefs.getStringList('moodData') ?? [];
    
    final now = DateTime.now();
    final formattedDate = "${now.day}/${now.month}/${now.year}";

    // Add the new mood entry
    moodData.add("$imagePath|$formattedDate|Feeling ${dialogTitle.split(' ')[2]}");
    
    // Save the updated list
    await prefs.setStringList('moodData', moodData);

    // Close the dialog and navigate to the mood tracker page
    Navigator.of(context).pop();
    Navigator.pushNamed(context, '/moodtracker');
  },
  child: Text("ok".tr(), style: AppFonts.fontSizeSix,),
),


                ],
              ),
            );
          },
        );
      },
      padding: EdgeInsets.zero,
      minWidth: 0,
      child: Image.asset(imagePath, width: 49),
    ),
  );
}
 
 
