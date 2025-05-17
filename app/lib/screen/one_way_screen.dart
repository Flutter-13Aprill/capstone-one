import 'package:app/screen/flight_result_screen.dart';
import 'package:app/screen/widgets/button/fly_chosse_btton.dart';
import 'package:app/screen/widgets/date_picker/date_picker_widget.dart';
import 'package:app/screen/widgets/dropdown_menu/cityies_dropdown_menu.dart';
import 'package:app/screen/widgets/increments/passenger_counter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class OneWayScreen extends StatefulWidget {
  const OneWayScreen({super.key});

  @override
  State<OneWayScreen> createState() => _OneWayScreenState();
}

class _OneWayScreenState extends State<OneWayScreen> {
  // Stores the selected varibles.

  String departureCity = "";
  String arrivalCity = "";
  DateTime selectedDate =
      DateTime.now(); // Stores the selected date, initialized to the current date.
  int passengerCount = 1; // Stores the selected departure city.

  void _onDepartureCitySelected(String city) {
    setState(() {
      departureCity = city; // Updates the departure city.
    });
  }

  void _onArrivalCitySelected(String city) {
    setState(() {
      arrivalCity = city; // Updates the arrival city.
    });
  }

  void _onDateSelected(DateTime date) {
    setState(() {
      // Updates the selectedDate
      selectedDate = date;
    });
  }

  void _onPassengerCountChanged(int count) {
    setState(() {
      passengerCount = count; // Updates the selectedDate
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //custom widgets
            CityiesDropdownMenu(
              whereLocationKey: "from", //give it rom
              onCitySelected:
                  _onDepartureCitySelected, //call _onDepartureCitySelected
            ),
            CityiesDropdownMenu(
              whereLocationKey: "to",
              onCitySelected: _onArrivalCitySelected,
            ),
            SizedBox(height: 8), //add space
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 16),
              child: Text(
                "Select Date".tr(),
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),

            DatePickerWidget(
              //call DatePickerWidget
              onChosseDate:
                  _onDateSelected, // Pass the _onDateSelected function
            ),
            //call custom wigets
            PassengerCounter(onChanged: _onPassengerCountChanged),
            //calll FlyChosseBtton
            FlyChosseBtton(
              title: "booknow",
              onPressed: () {
                //testi
                // print("selectedDate:$selectedDate");
                // print("arrivalCity:$arrivalCity");
                // print("departureCity:$departureCity");
                //print("passengerCount:$passengerCount");
                //add values to controllar 
                flyContrlollr.arrivalCity = arrivalCity;
                flyContrlollr.selectedDate = selectedDate;
                flyContrlollr.departureCity = departureCity;
                flyContrlollr.passengerCount = passengerCount;

                Navigator.push(
                  //Navigatat to the page and give it atrbutes
                  context,
                  MaterialPageRoute(builder: (context) => FlightResultScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
