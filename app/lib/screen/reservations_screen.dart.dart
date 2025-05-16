import 'package:app/screen/bottom_navigation_bar_screen.dart';
import 'package:app/screen/widgets/button/button.dart';
import 'package:app/screen/widgets/container/container_choose_tiket.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:app/controllar/resvervation_result_controllar.dart';

class ReservationsScreen extends StatefulWidget {
  const ReservationsScreen({super.key});

  @override
  State<ReservationsScreen> createState() => _ReservationsScreenState();
}

class _ReservationsScreenState extends State<ReservationsScreen> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text("Reservations".tr())),// App bar with the localized title "Reservations".
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the main content.
        child: Column(
          children: [
            //print reservation if ther a reservation 
             ResvervationResultControllar.reservationResult.length!=0?
            ListView.builder(
              //itemCount is number of reservationResult
              itemCount: ResvervationResultControllar.reservationResult.length,
              itemBuilder: (context, index) {
                //take indx that have list inside 
                final sublist =
                    ResvervationResultControllar.reservationResult[index];

                return Column(
                  children: [
                    //return ContainerChooseTiket wit value of list 
                    ContainerChooseTiket(
                      departureCity: sublist[0],
                      arrivalCity: sublist[1],
                      passengerCount: sublist[2] as int,
                    ),
                    SizedBox(height: 20),
                  ],
                );
              },
            ):Text(""),//if lis empty print nothing

            
          ],
        ),
      ),
    );
  }
}
