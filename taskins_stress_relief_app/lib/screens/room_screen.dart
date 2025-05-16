import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskins_stress_relief_app/themes/styles/app_colors.dart';
import 'package:taskins_stress_relief_app/themes/styles/app_fonts.dart';
import 'package:taskins_stress_relief_app/themes/theme_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RoomScreen extends StatefulWidget {
  const RoomScreen({super.key});

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  bool hasFrame = false;

  @override
  void initState() {
    super.initState();
     
    _loadFrameState();
  }
  Future<void> _claimFrame() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('hasFrame', true);
}

 

  Future<void> _loadFrameState() async {
  final prefs = await SharedPreferences.getInstance();
  
  // Load the frame state
  setState(() {
    hasFrame = prefs.getBool('hasFrame') ?? false;
  });
}



  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, '/explore');
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.reddishBrown),
        ),
        elevation: 0,
        backgroundColor: themeManager.themeMode == ThemeMode.dark
            ? AppColors.darkOrange
            : AppColors.lightOrange,
      ),
      backgroundColor: themeManager.themeMode == ThemeMode.dark
          ? AppColors.darkOrange
          : AppColors.lightOrange,
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 16),
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
                  border: const Border(
                    top: BorderSide(color: Color(0xFF8C3117), width: 4),
                    left: BorderSide(color: Color(0xFF8C3117), width: 4),
                    right: BorderSide(color: Color(0xFF8C3117), width: 4),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    Text("Finish your Tasks", style: AppFonts.fontSizeOne),
                    Text("and win items for your room", style: AppFonts.fontSizeFour),
                    const SizedBox(height: 300),
                  Stack(
                    clipBehavior: Clip.none,
  alignment: Alignment.center,
  children: [
  
    // Table Image
    Container(
      width: 300,
      height: 300,
      child: Image.asset(
        "lib/assets/images/round-table.png",
        fit: BoxFit.cover,
      ),
    ),
    
    // Frame Image (if earned)
    if (hasFrame)
      Positioned(
        bottom: 230, // Adjust this value to move the frame up or down
        child: Container(
          width: 100,
          height: 100,
          child: Image.asset(
            "lib/assets/images/frame.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
  ],
),

                   
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

