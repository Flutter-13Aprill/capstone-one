import 'package:app/screen/flight_result_screen.dart';
import 'package:app/screen/second_flight_result_screen.dart';
import 'package:app/screen/widgets/button/button.dart';
import 'package:app/screen/widgets/button/fly_chosse_btton.dart';
import 'package:app/screen/widgets/date_picker/date_picker_widget.dart';
import 'package:app/screen/widgets/dropdown_menu/cityies_dropdown_menu.dart';
import 'package:app/screen/widgets/increments/passenger_counter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class RoundTripScreen extends StatefulWidget {
  const RoundTripScreen({super.key});

  @override
  State<RoundTripScreen> createState() => _RoundTripScreenState();
}

class _RoundTripScreenState extends State<RoundTripScreen> {
  // Stores the varibles from secnd and first trip
  String? departureCity;
  String? arrivalCity;
  DateTime selectedDate = DateTime.now();
  int passengerCount = 1;
  String? departureCitySecondRound;
  String? arrivalCitySecondRound;
  DateTime selectedDateSecondRound = DateTime.now();
  int passengerCountSecondRound = 1;
  void _onDepartureCitySelected(String city) {
    setState(() {
      //update departureCity
      departureCity = city;
    });
  }

  void _onDepartureCitySelectedSecondRoun(String city) {
    setState(() {
      //update departureCitySecondRound
      departureCitySecondRound = city;
    });
  }

  void _onArrivalCitySelected(String city) {
    setState(() {
      //update arrivalCitySecondRound
      arrivalCitySecondRound = city;
    });
  }

  void _onArrivalCitySelectedSecondRoun(String city) {
    setState(() {
      //update arrivalCity

      arrivalCity = city;
    });
  }

  void _onDateSelected(DateTime date) {
    setState(() {
      //update selectedDate
      selectedDate = date;
    });
  }

  void _onDateSelectedSecondRoundTrip(DateTime date) {
    setState(() {
      selectedDateSecondRound = date;

      //update selectedDateSecondRound
    });
  }

  void _onPassengerCountChanged(int count) {
    setState(() {
      //update passengerCount

      passengerCount = count;
    });
  }

  void _onPassengerCountChangedSecndRoundTrip(int count) {
    setState(() {
      //update passengerCountSecondRound

      passengerCountSecondRound = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 16), // Vertical spacing.
          Container(
            margin: EdgeInsets.only(left: 16), // Vertical spacing.
            child: Text(
              "first trip".tr(), // Localized text for "first trip".
              style:
                  Theme.of(
                    context,
                  ).textTheme.headlineLarge, // Localized text for "first trip".
            ),
          ),

          CityiesDropdownMenu(
            whereLocationKey:
                "from", // Key to identify this dropdown as the departure city for the first trip
            onCitySelected:
                _onDepartureCitySelected, // Key to identify this dropdown as the departure city for the first trip
          ),
          CityiesDropdownMenu(
            whereLocationKey:
                "to", // Key to identify this dropdown as the arrival city for the first trip.
            onCitySelected:
                _onArrivalCitySelected, // Key to identify this dropdown as the arrival city for the first trip.
          ),
          SizedBox(height: 8), // Vertical spacing.

          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 16),
            child: Text(
              "Select Date".tr(), // Vertical spacing.

              style:
                  Theme.of(
                    context,
                  ).textTheme.headlineLarge, // Vertical spacing.
            ),
          ),

          DatePickerWidget(
            onChosseDate: _onDateSelected,  // Callback when a date is selected for the first trip.
          ),
          PassengerCounter(onChanged: _onPassengerCountChanged),// Widget to select the number of passengers for the first trip.

          SizedBox(height: 16),
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Text(
              "second trip".tr(),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),

          CityiesDropdownMenu(
            whereLocationKey: "from",
            onCitySelected: _onDepartureCitySelectedSecondRoun,
          ),
          CityiesDropdownMenu(
            whereLocationKey: "to",
            onCitySelected: _onArrivalCitySelectedSecondRoun,
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 16),
            child: Text(
              "Select Date".tr(),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),

          DatePickerWidget(
            onChosseDate:
                _onDateSelectedSecondRoundTrip, // Pass the _onDateSelected function
          ),
          PassengerCounter(onChanged: _onPassengerCountChangedSecndRoundTrip),
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            //cal custm FlyChosseBtton
            child: FlyChosseBtton(
              title: "booknow",
              onPressed: () {
                //Navigat to SecondFlightResultScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => SecondFlightResultScreen(
                          selectedDate: selectedDate,
                          arrivalCity: arrivalCity,
                          departureCity: departureCity,
                          passengerCount: passengerCount,
                          selectedDateSecondRound: selectedDateSecondRound,
                          arrivalCitySecondRound: arrivalCitySecondRound,
                          departureCitySecondRound: departureCitySecondRound,
                          passengerCountSecondRound: passengerCountSecondRound,
                        ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
 