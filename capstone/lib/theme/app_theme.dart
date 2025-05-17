import 'package:flutter/material.dart';

class AppTheme {
  static final themeDefault = ThemeData(

    //change color for all pages 
    scaffoldBackgroundColor:Color.fromARGB(255, 35, 36, 40),
    appBarTheme: AppBarTheme(backgroundColor: Color.fromARGB(255,35, 36, 40),titleTextStyle: TextStyle(color: Colors.white,fontSize: 24))
    ,textTheme: TextTheme(

      //change text color
      bodyMedium: TextStyle(
        color: Colors.white,
      ),
     
  ));


}