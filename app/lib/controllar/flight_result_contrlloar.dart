import 'package:app/controllar/resvervation_result_controllar.dart';
import 'package:app/extension/Screen/get_size_screen.dart';
import 'package:app/main.dart';
import 'package:app/screen/reservations_screen.dart.dart';
import 'package:app/theme/style_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FlightResultContrlloar {
  String departureCity = "";
  String arrivalCity = "";
  DateTime selectedDate = DateTime.now();
  int passengerCount = 1;
  TextStyle? IsDarkThemTrue({required BuildContext context}) {
    return isDarkThem
        ? Theme.of(context).textTheme.titleSmall
        : Theme.of(context).textTheme.headlineSmall;
  }

  addTicets({
    required BuildContext context,
    required String departureCity,
    required String arrivalCity,
    required DateTime selectedDate,
    required int passengerCount,
  }) {
    //makelist with ticketss details
    List userResrvation = [
      departureCity,
      arrivalCity,
      passengerCount,
      selectedDate,
    ];
    //sae value f titcks
    ResvervationResultControllar.reservationResult.add(userResrvation);
  }
}
