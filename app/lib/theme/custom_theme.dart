import 'package:app/theme/style_color.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static final defalutTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: StyleColor.promaryBlueColor,
      secondary: StyleColor.promaryBlueColor,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: StyleColor.promaryBlueColor,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
      /*bodyLarge: TextStyle(//OnbordingScreen
        color: StyleColor.primaryWhiteColor,
        fontSize: 45,
        fontWeight: FontWeight.bold,
      ),*/
      titleLarge: TextStyle(
        //OnbordingScreen
        color: StyleColor.primaryWhiteColor,
        fontSize: 45,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(color: StyleColor.primaryWhiteColor, fontSize: 20),
      bodyMedium: TextStyle(
        color: StyleColor.primaryCharcoalColor,
        fontSize: 19,
      ),
      headlineSmall: TextStyle(
        color: StyleColor.promarySecondBlueColor,
        fontSize: 18,
      ),
    ),
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.light(
        primary: StyleColor.promaryBlueColor,
        secondary: StyleColor.promarySecondBlueColor,
        tertiary: StyleColor.primaryTaupeColor,
      ),
      height: 100,
      minWidth: 300,
      buttonColor: StyleColor.promaryBlueColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: StyleColor.promarySecondBlueColor,
      selectedItemColor: StyleColor.primaryWhiteColor,
      selectedIconTheme: IconThemeData(color: StyleColor.primaryWhiteColor),
      selectedLabelStyle: TextStyle(
        color: StyleColor.primaryWhiteColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      unselectedIconTheme: IconThemeData(color: StyleColor.primaryBlackColor),
      unselectedItemColor: StyleColor.primaryBlackColor,
      unselectedLabelStyle: TextStyle(
        color: StyleColor.primaryBlackColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          fontSize: 26,
          color: StyleColor.promarySecondBlueColor,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            width: 2,
            color: StyleColor.promarySecondBlueColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            width: 2,
            color: StyleColor.promarySecondBlueColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            width: 2,
            color: StyleColor.promarySecondBlueColor,
          ),
        ),
      ),
    ),

    datePickerTheme: DatePickerThemeData(
      inputDecorationTheme: InputDecorationTheme(
        prefixStyle: TextStyle(
          fontSize: 18, // تصغير خط labelText في showDatePicker
          color: StyleColor.promaryBlueColor,
        ),
        labelStyle: TextStyle(
          fontSize: 18, // تصغير خط labelText في showDatePicker
          color: StyleColor.promaryBlueColor,
        ),
        prefixIconColor: StyleColor.promaryBlueColor,
      ),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: StyleColor.promaryBlueColor, width: 3),
      ),
      headerHelpStyle: TextStyle(
        fontSize: 12, // تصغير خط "Date" في رأس showDatePicker
        color: StyleColor.primaryBlackColor,
        fontWeight: FontWeight.w600,
      ),
      dayStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: StyleColor.promaryBlueColor,
      ),
      weekdayStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: StyleColor.promaryBlueColor,
      ),
      yearStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: StyleColor.promaryBlueColor,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
          StyleColor.promarySecondBlueColor,
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: StyleColor.primaryWhiteColor),
      backgroundColor: StyleColor.promarySecondBlueColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: StyleColor.primaryWhiteColor,
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
    ),
    iconTheme: IconThemeData(color: StyleColor.promaryBlueColor),
    listTileTheme: ListTileThemeData(
      //selectedColor: StyleColor.primaryTaupeColor,
      iconColor: StyleColor.promarySecondBlueColor,

      //tileColor: StyleColor.promarySecondBlueColor,
      //contentPadding: EdgeInsets.all(8),
      /*shape: UnderlineInputBorder(
        borderSide: BorderSide(
          color: StyleColor.promarySecondBlueColor,
         
        ),
      ),*/
    ),
    drawerTheme: DrawerThemeData(backgroundColor: StyleColor.primaryWhiteColor,),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          StyleColor.promarySecondBlueColor,
        ),
      ),
    ),
  );
  //
  ///
  //////
  ///

  static final darkTheme = ThemeData(
       bottomSheetTheme:BottomSheetThemeData(
        backgroundColor: StyleColor.primaryBlackColor,
        shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
       ),

    scaffoldBackgroundColor: StyleColor.primaryBlackColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: StyleColor.primaryBlackColor,
      secondary: StyleColor.primaryWhiteColor,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: StyleColor.primaryWhiteColor,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
      /*bodyLarge: TextStyle(//OnbordingScreen
        color: StyleColor.primaryWhiteColor,
        fontSize: 45,
        fontWeight: FontWeight.bold,
      ),*/
      titleLarge: TextStyle(
        //OnbordingScreen
        color: StyleColor.primaryWhiteColor,
        fontSize: 45,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(color: StyleColor.primaryWhiteColor, fontSize: 20),
      bodyMedium: TextStyle(color: StyleColor.primaryWhiteColor, fontSize: 19),
      headlineSmall: TextStyle(
        color: StyleColor.primaryBlackColor,
        fontSize: 18,
      ),
    ),
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.dark(
        primary: StyleColor.primaryBlackColor,
        secondary: StyleColor.primaryWhiteColor,
        tertiary: StyleColor.primaryTaupeColor,
      ),
      height: 100,
      minWidth: 300,
      buttonColor: StyleColor.primaryWhiteColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: StyleColor.primaryBlackColor,
      selectedItemColor: StyleColor.primaryEcruColor,
      selectedIconTheme: IconThemeData(color: StyleColor.primaryEcruColor),
      selectedLabelStyle: TextStyle(
        color: StyleColor.primaryEcruColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      unselectedIconTheme: IconThemeData(color: StyleColor.primaryWhiteColor),
      unselectedItemColor: StyleColor.primaryWhiteColor,
      unselectedLabelStyle: TextStyle(
        color: StyleColor.primaryWhiteColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          fontSize: 26,
          color: StyleColor.primaryWhiteColor,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(width: 2, color: StyleColor.primaryWhiteColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(width: 2, color: StyleColor.primaryWhiteColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(width: 2, color: StyleColor.primaryWhiteColor),
        ),
      ),
    ),
     dialogTheme: DialogTheme(
       backgroundColor: StyleColor.primaryBlackColor
     ),
   

    datePickerTheme: DatePickerThemeData(
      inputDecorationTheme: InputDecorationTheme(
        prefixStyle: TextStyle(
          fontSize: 18, // تصغير خط labelText في showDatePicker
          color: StyleColor.primaryWhiteColor,
        ),
        labelStyle: TextStyle(
          fontSize: 18, // تصغير خط labelText في showDatePicker
          color: StyleColor.primaryWhiteColor,
        ),
        prefixIconColor: StyleColor.primaryWhiteColor,
      ),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: StyleColor.promaryBlueColor, width: 3),
      ),
      headerHelpStyle: TextStyle(
        fontSize: 12, // تصغير خط "Date" في رأس showDatePicker
        color: StyleColor.primaryWhiteColor,
        fontWeight: FontWeight.w600,
      ),
      dayStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: StyleColor.primaryWhiteColor,
      ),
      weekdayStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: StyleColor.primaryWhiteColor,
      ),
      yearStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: StyleColor.primaryWhiteColor,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
          StyleColor.primaryWhiteColor,
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: StyleColor.primaryWhiteColor),
      backgroundColor: StyleColor.primaryBlackColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: StyleColor.primaryWhiteColor,
      ),
    ),
    
    iconTheme: IconThemeData(color: StyleColor.primaryWhiteColor),
    listTileTheme: ListTileThemeData(
      //selectedColor: StyleColor.primaryTaupeColor,
      iconColor: StyleColor.primaryWhiteColor,
      //tileColor: StyleColor.promarySecondBlueColor,
      //contentPadding: EdgeInsets.all(8),
      /*shape: UnderlineInputBorder(
        borderSide: BorderSide(
          color: StyleColor.promarySecondBlueColor,
         
        ),
      ),*/
    ),
    drawerTheme: DrawerThemeData(backgroundColor: StyleColor.primaryBlackColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(StyleColor.primaryBlackColor),
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelColor:StyleColor.primaryWhiteColor ,
      
    )
  );
 }
