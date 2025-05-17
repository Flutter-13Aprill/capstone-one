import 'dart:async';

import 'package:app/controllar/flight_result_contrlloar.dart';
import 'package:app/extension/Screen/get_size_screen.dart';
import 'package:app/main.dart';
import 'package:app/screen/reservations_screen.dart.dart';
import 'package:app/screen/widgets/container/container_choose_tiket.dart';
import 'package:app/screen/widgets/container/container_shimmer.dart';
import 'package:app/theme/style_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FlightResultScreen extends StatefulWidget {
  /// StatefulWidget to display the results of a flight search.
  //declare varibles

  FlightResultScreen({super.key});

  @override
  State<FlightResultScreen> createState() => _FlightResultScreenState();
}

FlightResultContrlloar flyContrlollr =
    FlightResultContrlloar(); //call FlightResultContrlloar

class _FlightResultScreenState extends State<FlightResultScreen> {
  bool isShimmer = true; // Controls whether to show the shimmer loading effect.
  Timer? timer; // Controls whether to show the shimmer loading effect.

  @override
  void initState() {
    // TODO: implement initState
    //add values in list
    flyContrlollr.addTicets(
      context: context,
      departureCity: flyContrlollr.departureCity,
      arrivalCity: flyContrlollr.arrivalCity,
      selectedDate: flyContrlollr.selectedDate,
      passengerCount: flyContrlollr.passengerCount,
    );
    super.initState();
    //timer to show shimmer until 5 sconds
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      isShimmer = false; //chane value
      setState(() {}); //update value
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SelectFlight".tr())), //appbar title

      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    flyContrlollr.departureCity
                        .toString(), //dspaly departureCity
                    style: //style accourding to isDarkThem
                        flyContrlollr.IsDarkThemTrue(context: context),
                  ),
                  SizedBox(
                    //add image
                    height: context.getHeigth() * .055,
                    width: context.getWidth() * .59,
                    child: Image.asset("assets/images/6.png"),
                  ),
                  Text(
                    //dispaly arrivalCity
                    flyContrlollr.arrivalCity.toString(),
                    style: flyContrlollr.IsDarkThemTrue(context: context),
                  ),
                ],
              ),
              Text(
                //diaply FlightSchedule and style it
                "FlightSchedule".tr(),
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                //diaply selectedDate and style it
                flyContrlollr.selectedDate.toString(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 16), //add space
              isShimmer //if isShimmer value true  call ContainerShimmer other wise InkWell
                  ? ContainerShimmer()
                  : InkWell(
                    /** onTap: () {
                      //go showTicketDetials
                      flyContrlollr.showTicketDetials(
                        context: context,
                        arrivalCity: widget.arrivalCity,
                        passengerCount: widget.passengerCount,
                        selectedDate: widget.selectedDate,
                        departureCity: widget.departureCity,
                      );
                    }, */
                    onTap: () {
                      //
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ReservationsScreen();
                          },
                        ),
                      );
                    },
                    child: ContainerChooseTiket(
                      //ContainerChooseTiket custem widets
                      passengerCount: flyContrlollr.passengerCount,

                      departureCity: flyContrlollr.departureCity,
                      arrivalCity: flyContrlollr.arrivalCity,
                    ),
                  ),
              SizedBox(height: 16),

              isShimmer
                  ? ContainerShimmer()
                  : InkWell(
                    child: ContainerChooseTiket(
                      passengerCount: flyContrlollr.passengerCount,

                      departureCity: flyContrlollr.departureCity,
                      arrivalCity: flyContrlollr.arrivalCity,
                    ),
                    // onDoubleTap: onDoubleTapTickit,
                    /**onTap: () {
                      //go showTicketDetials
                      flyContrlollr.showTicketDetials(
                        context: context,
                        arrivalCity: widget.arrivalCity,
                        passengerCount: widget.passengerCount,
                        selectedDate: widget.selectedDate,
                        departureCity: widget.departureCity,
                      );
                    }, */
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReservationsScreen(),
                        ),
                      );
                    },
                  ),
              SizedBox(height: 16),
              isShimmer
                  ? ContainerShimmer()
                  : InkWell(
                    child: ContainerChooseTiket(
                      passengerCount: flyContrlollr.passengerCount,

                      departureCity: flyContrlollr.departureCity,
                      arrivalCity: flyContrlollr.arrivalCity,
                    ),
                    //onDoubleTap: onDoubleTapTickit,
                    /* onTap: () {
                      //go showTicketDetials
                      flyContrlollr.showTicketDetials(
                        context: context,
                        arrivalCity: widget.arrivalCity,
                        passengerCount: widget.passengerCount,
                        selectedDate: widget.selectedDate,
                        departureCity: widget.departureCity,
                      );
                    },*/
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReservationsScreen(),
                        ),
                      );
                    },
                  ),
              SizedBox(height: 16),
              isShimmer
                  ? ContainerShimmer()
                  : InkWell(
                    //onDoubleTap: onDoubleTapTickit,
                    child: ContainerChooseTiket(
                      passengerCount: flyContrlollr.passengerCount,

                      departureCity: flyContrlollr.departureCity,
                      arrivalCity: flyContrlollr.arrivalCity,
                    ),
                    /* onTap: () {
                      //go showTicketDetials
                      flyContrlollr.showTicketDetials(
                        context: context,
                        arrivalCity: widget.arrivalCity,
                        passengerCount: widget.passengerCount,
                        selectedDate: widget.selectedDate,
                        departureCity: widget.departureCity,
                      );
                    },*/
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReservationsScreen(),
                        ),
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
