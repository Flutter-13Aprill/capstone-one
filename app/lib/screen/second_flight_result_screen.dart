import 'dart:async';
import 'dart:math';

import 'package:app/controllar/resvervation_result_controllar.dart';
import 'package:app/extension/Screen/get_size_screen.dart';
import 'package:app/main.dart';
import 'package:app/screen/flight_result_screen.dart';
import 'package:app/screen/round_trip_screen.dart';
import 'package:app/screen/widgets/container/container_choose_tiket.dart';
import 'package:app/screen/widgets/container/container_shimmer.dart';
import 'package:app/theme/style_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
 
class SecondFlightResultScreen extends StatefulWidget {
  SecondFlightResultScreen({super.key});

  @override
  State<SecondFlightResultScreen> createState() =>
      _SecondFlightResultScreenState();
}

class _SecondFlightResultScreenState extends State<SecondFlightResultScreen> {
  bool isShimmer =
      true; // Controls the visibility of the shimmer loading effect.
  Timer? timer; // Timer to manage the duration of the shimmer effect.

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Sets a timer to stop the shimmer effect after 5 seconds.

    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      isShimmer = false; // Hides the shimmer.
      setState(() {}); // Hides the shimmer.
    });
  }

  void showTicketDetials() {
    // Shows the detailed information of a selected flight ticket in a bottom sheet.
    showModalBottomSheet(
      isScrollControlled:
          true, // Allows the bottom sheet to be scrollable if its content is too large.
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: // BoxDecoration for styling the bottom sheet.
                !isDarkThem // Checks if the app is in dark theme.
                    ? StyleColor.primaryWhiteColor
                    : StyleColor.primaryBlackColor,
          ),
          width: context.getWidth(), // Sets the width to the screen width.
          height:
              context.getHeigth() *
              0.6, // Sets the height to 60% of the screen height.
          padding: const EdgeInsets.all(
            16.0,
          ), // Adds padding around the content.
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Aligns children to the left.
            children: <Widget>[
              Center(
                child: Container(
                  width: context.getWidth() * 0.3, // 30% of the screen width.
                  height:
                      context.getHeigth() * 0.01, // 30% of the screen width.
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      2.5,
                    ), // 30% of the screen width.
                    color:
                        !isDarkThem // Background color based on theme.
                            ? StyleColor.primaryWhiteColor
                            : Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 16.0), // Background color based on theme.
              Text(
                'flight_details'.tr(), // Localized text for "Flight Details".
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              //display details
              const SizedBox(height: 16.0),
              Text(
                '${'from'.tr()}:${secondFlyResultControllars.departureCity}',
              ),
              Text('${'to'.tr()}: ${secondFlyResultControllars.arrivalCity}'),
              Text(
                '${'departure_date'.tr()}:${secondFlyResultControllars.selectedDate}',
              ),
              Text('${'departure_time'.tr()}:${"departure_time1".tr()}'),
              Text('${'arrival_date'.tr()}: ${"arrival_date1".tr()}'),
              Text('${'arrival_time'.tr()}:${"arrival_time1".tr()}'),
              Text('${'airline'.tr()}:emiratesairline'.tr()),
              Text('${'flight_number'.tr()}:${"flight_number2".tr()}'),
              Text('${'price'.tr()}: 12500 SAR'.tr()),
              Text(
                '${'passengerCount'.tr()}: ${secondFlyResultControllars.passengerCount}',
              ),
            ],
          ),
        );
      },
    );
  }

  onDoubleTapTickit() {
    // Handles the action when a ticket container is double-tapped.

    List userResrvation = [
      // Handles the action when a ticket container is double-tapped.
      secondFlyResultControllars.departureCity,
      secondFlyResultControllars.arrivalCity,
      secondFlyResultControllars.passengerCount,
      secondFlyResultControllars.selectedDate,
    ];
    //add to list
    ResvervationResultControllar.reservationResult.add(userResrvation);
    //navigat to FlightResultScreen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FlightResultScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SelectFlight".tr())), //display appBar

      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    secondFlyResultControllars.departureCity
                        .toString(), //departureCity and theme depend on isDarkThem
                    style:
                        isDarkThem
                            ? Theme.of(context).textTheme.titleSmall
                            : Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(
                    //add image
                    height: context.getHeigth() * .05,
                    width: context.getWidth() * .59,
                    child: Image.asset("assets/images/6.png"),
                  ),
                  Text(
                    secondFlyResultControllars.arrivalCity
                        .toString(), //arrivalCity and theme depend on isDarkThem
                    style:
                        isDarkThem
                            ? Theme.of(context).textTheme.titleSmall
                            : Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              Text(
                "FlightSchedule"
                    .tr(), //FlightSchedule and theme depend on isDarkThem
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                //selectedDate and theme depend on isDarkThem
                secondFlyResultControllars.selectedDate.toString(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: 16), //space
              isShimmer //dispaly ContainerShimmer when isShimmer true otherwise InkWell
                  ? ContainerShimmer()
                  : InkWell(
                    onDoubleTap: onDoubleTapTickit, //call onDoubleTapTickit
                    onTap: () {
                      showTicketDetials(); //call showTicketDetials
                    },
                    child: ContainerChooseTiket(
                      passengerCount: secondFlyResultControllars.passengerCount,

                      departureCity: secondFlyResultControllars.departureCity,
                      arrivalCity: secondFlyResultControllars.arrivalCity,
                    ),
                  ),
              SizedBox(height: 16),

              isShimmer
                  ? ContainerShimmer()
                  : InkWell(
                    onDoubleTap: onDoubleTapTickit,
                    child: ContainerChooseTiket(
                      passengerCount: secondFlyResultControllars.passengerCount,

                      departureCity: secondFlyResultControllars.departureCity,
                      arrivalCity: secondFlyResultControllars.arrivalCity,
                    ),
                    onTap: () {
                      showTicketDetials();
                    },
                  ),
              SizedBox(height: 16),
              isShimmer
                  ? ContainerShimmer()
                  : InkWell(
                    child: ContainerChooseTiket(
                      passengerCount: secondFlyResultControllars.passengerCount,

                      departureCity: secondFlyResultControllars.departureCity,
                      arrivalCity: secondFlyResultControllars.arrivalCity,
                    ),
                    onTap: () {
                      showTicketDetials();
                    },
                    onDoubleTap: onDoubleTapTickit,
                  ),
              SizedBox(height: 16),
              isShimmer
                  ? ContainerShimmer()
                  : InkWell(
                    child: ContainerChooseTiket(
                      passengerCount: secondFlyResultControllars.passengerCount,
                      departureCity: secondFlyResultControllars.departureCity,
                      arrivalCity: secondFlyResultControllars.arrivalCity,
                    ),
                    onTap: () {
                      showTicketDetials();
                    },
                    onDoubleTap: () {
                      List userResrvation = [
                        secondFlyResultControllars.arrivalCity,
                        secondFlyResultControllars.passengerCount,
                        secondFlyResultControllars.selectedDate,
                      ];

                      ResvervationResultControllar.reservationResult.add(
                        userResrvation,
                      );
                    },
                  ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    timer!.cancel();
  }
}
