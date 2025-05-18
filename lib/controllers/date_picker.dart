import 'package:flutter/material.dart';

// -- External Package 
import 'package:intl/intl.dart';
// -- App Teeming
import 'package:shabah/style/app_colors.dart';

/// Shows a date picker dialog allowing the user to select a date between tomorrow and seven days from now. 
/// 
/// Returns the selected date as a formatted string (e.g., "18 May 2025"). If no date is selected, returns 'NO Date Picked'.
class DatePicker {

  String datePicked = '';

  static Future<String> selectDate(BuildContext context) async {

    DateTime? pickedDate = await showDatePicker(
      
      context: context, 
      initialDate: DateTime.now().add(Duration(days: 1)),
      firstDate: DateTime.now().add(Duration(days: 1)), 
      lastDate: DateTime.now().add(Duration(days: 7)),
      builder: (context, child) {
        return Theme(
          child: child!,
          data: Theme.of(context).copyWith(

            colorScheme: ColorScheme.light(
              primary: AppColors.tertiaryColor, // Background of selected date
              onPrimary: AppColors.primaryColor, // Foreground  of selected date
              onSurface: AppColors.secondaryColor // Color of days, months and years
            ),

            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.secondaryColor,
                textStyle: TextStyle(fontSize: 22)
              )
            )
          )
          );  
      },
    );

    if(pickedDate != null){
      return DateFormat('dd MMMM yyyy').format(pickedDate);
    }

    return 'NO Date Picked';
  }
}