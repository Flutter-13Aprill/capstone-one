import 'package:app/extension/Screen/get_size_screen.dart';
import 'package:app/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:app/theme/style_color.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart' show DateFormat; // Import for date formatting

class DatePickerWidget extends StatefulWidget {
  final Function(DateTime date)? onChosseDate;  // Defines an optional callback function that takes a DateTime as a parameter
  const DatePickerWidget({super.key, this.onChosseDate});  // Constructor for the DatePickerWidget

  @override
  State<DatePickerWidget> createState() => _DatePickerWidget();
}

class _DatePickerWidget extends State<DatePickerWidget> {
    // Tracks the currently displayed date, initialized to the current date and time

  DateTime _currentDate = DateTime.now(); // Tracks the currently displayed date
  String _currentMonth = DateFormat.yMMM().format(
    DateTime.now(),
  ); // Formatted current month
  DateTime? _selectedDate; // To store the picked date by the user (nullable)
  bool _isCalendarVisible = false; // Controls the visibility of the calendar

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_isCalendarVisible) {
          setState(() {    // Uses GestureDetector to detect taps outside the calendar to close it
            _isCalendarVisible =
                false; // Close the calendar when tapping outside
          });
        }
      },
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(              // GestureDetector to make the date selection box tappable
                onTap: () {
                  setState(() {
                    _isCalendarVisible =
                        !_isCalendarVisible; // Toggle calendar visibility on tap of the box
                  });
                },
                child: Container(//Container with spisfic style 
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color:StyleColor.primaryGrayeColor),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(// if user dont choose date hem we give it other chosse 
                        _selectedDate == null
                            ? 'Select Date'.tr()
                            : DateFormat('yyyy-MM-dd').format(_selectedDate!),
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      Icon(//open close clander 
                        _isCalendarVisible
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                      ),
                    ],
                  ),
                ),
              ),
              if (_isCalendarVisible) // Show the calendar only if _isCalendarVisible is true
                Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color:StyleColor.primaryGrayeColor, width: 6),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: CalendarCarousel(//call date picker
                    onDayPressed: (DateTime date, List events) {//when pres on date 
                      setState(() {
                        _currentDate =
                            date; // Update the currently displayed date
                        _selectedDate = date; // Save the selected date
                          widget.onChosseDate!(date);
                        _isCalendarVisible =
                            false; // Close the calendar after selection
                        print(
                          'Selected Date: ${_selectedDate.toString()}',
                        ); // Print the selected date
                      });
                    },
                    weekendTextStyle: TextStyle(
                      color:isDarkThem?StyleColor.primaryWhiteColor:
                          StyleColor
                              .promaryBlueColor, // Style for weekend days (Sat, Sun)
                    ),
                    weekdayTextStyle: TextStyle(
                      color:isDarkThem?StyleColor.primaryWhiteColor:
                          StyleColor
                              .promaryBlueColor, // Style for weekday names (Mon, Tue, etc.)
                    ),
                    thisMonthDayBorderColor:isDarkThem?StyleColor.primaryWhiteColor:
                        StyleColor
                            .promaryBlueColor, // Border color for days in the current month
                    headerTextStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ), // Style for the header text (month, year)
                    headerText: _currentMonth, // Display the current month
                    onCalendarChanged: (DateTime date) {
                      setState(
                        () => _currentMonth = DateFormat.yMMM().format(date),
                      ); // Update header on month change
                    },
                    weekFormat: false, // Display the full month view
                    height:
                        context.getHeigth() *
                        0.41, // Adjust height based on screen height
                    selectedDateTime:
                        _currentDate, // Highlight the currently selected date
                    selectedDayButtonColor:
                        StyleColor
                            .promaryBlueColor, // Background color for the selected day
                    selectedDayTextStyle: const TextStyle(
                      color: Colors.white,
                    ), // Text color for the selected day
                    daysHaveCircularBorder: true, // Make the day circles
                  ),
                ),
              if (_selectedDate != null &&
                  !_isCalendarVisible) // Show selected date outside the box
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    'Selected Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate!)}'
                        .tr(),
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
