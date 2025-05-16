import 'dart:async';

import 'package:app/controllar/resvervation_result_controllar.dart';
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
  final String? departureCity;
  final String? arrivalCity;
  final int passengerCount;
  final DateTime selectedDate;
  FlightResultScreen({
    super.key,
    required this.departureCity,
    required this.arrivalCity,
    required this.passengerCount,
    required this.selectedDate,
  });

  @override
  State<FlightResultScreen> createState() => _FlightResultScreenState();
}

class _FlightResultScreenState extends State<FlightResultScreen> {
  bool isShimmer = true; // Controls whether to show the shimmer loading effect.
  Timer? timer; // Controls whether to show the shimmer loading effect.

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //timer to show shimmer until 5 sconds
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      isShimmer = false; //chane value
      setState(() {}); //update value
    });
  }

  void showTicketDetials() {
    // Controls whether to show the shimmer loading effect.
    showModalBottomSheet(
      isScrollControlled:
          true, // Controls whether to show the shimmer loading effect.
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            //BoxDecoration style
            color:
                !isDarkThem //change color depend on mood
                    ? StyleColor.primaryWhiteColor
                    : StyleColor
                        .primaryBlackColor, // تحديد لون الخلفية بناءً على الثيم
          ),
          //give width & height &padding
          width: context.getWidth(),
          height: context.getHeigth() * 0.6,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                //Container
                child: Container(
                  width: 40,
                  height: 5,
                  //width:
                      //MediaQuery.of(context).size.width *
                   //   0.1, // Sets the width to 10% of the screen width.
                  //height:
                    //  MediaQuery.of(context).size.height *
                     // 0.006, // Sets the height to approximately 0.6% of the screen height.
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.5),// Rounds the corners of the container.
                    color: StyleColor.primaryGrayeColor,//color it
                  ),
                ),
              ),
              const SizedBox(height: 16.0),//add space
              Text(
                'flight_details'.tr(),
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              //display mre detail about travle 
              Text('${'from'.tr()}:${widget.departureCity}'),
              Text('${'to'.tr()}: ${widget.arrivalCity}'),
              Text('${'departure_date'.tr()}:${widget.selectedDate}'),
              Text('${'departure_time'.tr()}:${"departure_time1".tr()}'),
              Text('${'arrival_date'.tr()}: ${"arrival_date1".tr()}'),
              Text('${'arrival_time'.tr()}:${"arrival_time1".tr()}'),
              Text('${'airline'.tr()}:emiratesairline'.tr()),
              Text('${'flight_number'.tr()}:${"flight_number2".tr()}'),
              Text('${'price'.tr()}: 12500 SAR'.tr()),
              Text('${'passengerCount'.tr()}: ${widget.passengerCount}'),
            ],
          ),
        );
      },
    );
  }

    /// Adds selected flight to reservations on double tap.

  onDoubleTapTickit() {
    //makelist with ticketss details
    List userResrvation = [
      widget.departureCity,
      widget.arrivalCity,
      widget.passengerCount,
      widget.selectedDate,
    ];
       //sae value f titcks
    ResvervationResultControllar.reservationResult.add(userResrvation);
       //go to ReservationsScreen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReservationsScreen()),
    ); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SelectFlight".tr())),//appbar title 

      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: 20),
              Row(
            
                children: [
                  Text(
                    widget.departureCity.toString(),//dspaly departureCity
                    style://style accourding to isDarkThem
                        isDarkThem
                            ? Theme.of(context).textTheme.titleSmall
                            : Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(//add image 
                    height: context.getHeigth() * .055,
                    width: context.getWidth() * .59,
                    child: Image.asset("assets/images/6.png"),
                  ),
                  Text(//dispaly arrivalCity
                    widget.arrivalCity.toString(),
                    style:
                        isDarkThem
                            ? Theme.of(context).textTheme.titleSmall
                            : Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              Text(//diaply FlightSchedule and style it 
                "FlightSchedule".tr(),
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(//diaply selectedDate and style it 
                widget.selectedDate.toString(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 16),//add space 
              isShimmer//if isShimmer value true  call ContainerShimmer other wise InkWell
                  ? ContainerShimmer()
                  : InkWell(
                    onTap: () {//go showTicketDetials
                      showTicketDetials();
                    },
                    onDoubleTap: onDoubleTapTickit,//onDoubleTap go 
                    child: ContainerChooseTiket(//ContainerChooseTiket custem widets 
                      passengerCount: widget.passengerCount,

                      departureCity: widget.departureCity,
                      arrivalCity: widget.arrivalCity,
                    ),
                  ),
              SizedBox(height: 16),

              isShimmer
                  ? ContainerShimmer()
                  : InkWell(
                    child: ContainerChooseTiket(
                      passengerCount: widget.passengerCount,

                      departureCity: widget.departureCity,
                      arrivalCity: widget.arrivalCity,
                    ),
                    onDoubleTap: onDoubleTapTickit,
                    onTap: () {
                      showTicketDetials();
                    },
                  ),
              SizedBox(height: 16),
              isShimmer
                  ? ContainerShimmer()
                  : InkWell(
                    child: ContainerChooseTiket(
                      passengerCount: widget.passengerCount,

                      departureCity: widget.departureCity,
                      arrivalCity: widget.arrivalCity,
                    ),
                    onDoubleTap: onDoubleTapTickit,
                    onTap: () {
                      showTicketDetials();
                    },
                  ),
              SizedBox(height: 16),
              isShimmer
                  ? ContainerShimmer()
                  : InkWell(
                    onDoubleTap: onDoubleTapTickit,
                    child: ContainerChooseTiket(
                      passengerCount: widget.passengerCount,

                      departureCity: widget.departureCity,
                      arrivalCity: widget.arrivalCity,
                    ),
                    onTap: () {
                      showTicketDetials();
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
