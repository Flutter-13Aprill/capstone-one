import 'package:app/extension/Screen/get_size_screen.dart';
import 'package:app/main.dart';
import 'package:app/screen/widgets/container/container_choose_tiket.dart';
import 'package:app/theme/style_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:app/controllar/resvervation_result_controllar.dart';

class ReservationsScreen extends StatefulWidget {
  const ReservationsScreen({super.key});

  @override
  State<ReservationsScreen> createState() => _ReservationsScreenState();
}

class _ReservationsScreenState extends State<ReservationsScreen> {
  //defain obj controllar
  //ReservationsControllar reservationsControllar = ReservationsControllar();
/**
  showTicketDetials({
    required BuildContext context,
    required String departureCity,
    required String arrivalCity,
    required DateTime selectedDate,
    required int passengerCount,
  }) {
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
                    : StyleColor.primaryBlackColor,
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
                  // width: 40,
                  // height: 5,
                  width:
                      context.getHeigth() *
                      0.1, // Sets the width to 10% of the screen width.
                  height:
                      context.getHeigth() *
                      0.006, // Sets the height to approximately 0.6% of the screen height.
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      2.5,
                    ), // Rounds the corners of the container.
                    color: StyleColor.primaryGrayeColor, //color it
                  ),
                ),
              ),
              const SizedBox(height: 16.0), //add space
              Text(
                'flight_details'.tr(),
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              //display mre detail about travle
              Text('${'from'.tr()}:${departureCity}'),
              Text('${'to'.tr()}: ${arrivalCity}'),
              Text('${'departure_date'.tr()}:${selectedDate}'),
              Text('${'departure_time'.tr()}:${"departure_time1".tr()}'),
              Text('${'arrival_date'.tr()}: ${"arrival_date1".tr()}'),
              Text('${'arrival_time'.tr()}:${"arrival_time1".tr()}'),
              Text('${'airline'.tr()}:emiratesairline'.tr()),
              Text('${'flight_number'.tr()}:${"flight_number2".tr()}'),
              Text('${'price'.tr()}: 12500 SAR'.tr()),
              Text('${'passengerCount'.tr()}: ${passengerCount}'),

              /*ElevatedButton(
                onPressed: () {
                  onDoubleTapTickit(context: context);
                },
                child: Text("press herr"),
              ),*/
            ],
          ),
        );
      },
    );
  }
 */
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reservations".tr()),
      ), // App bar with the localized title "Reservations".
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the main content.
        child: Column(
          children: [
            //print reservation if ther a reservation
            ResvervationResultControllar.reservationResult.length != 0
                ? Expanded(
                  child: ListView.builder(
                    //itemCount is number of reservationResult
                    itemCount:
                        ResvervationResultControllar.reservationResult.length,
                    itemBuilder: (context, index) {
                      //take indx that have list inside
                      final sublist =
                          ResvervationResultControllar.reservationResult[index];

                      return Column(
                        children: [
                          //return ContainerChooseTiket wit value of list
                          InkWell(
                            onTap:  (){},
                            child: ContainerChooseTiket(
                              departureCity: sublist[0],
                              arrivalCity: sublist[1],
                              passengerCount: sublist[2] as int,
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      );
                    },
                  ),
                )
                : Text(""), //if lis empty print nothing
          ],
        ),
      ),
    );
  }
}
