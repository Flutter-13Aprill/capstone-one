import 'package:app/extension/Screen/get_size_screen.dart';
import 'package:app/theme/style_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// Defines a StatelessWidget called ContainerChooseTiket
class ContainerChooseTiket extends StatelessWidget {
  // Declares final variables to be received when the widget is created
  final String? departureCity;
  final String? arrivalCity;
  final int passengerCount;
  const ContainerChooseTiket({
    // The constructor for the widget, receives the required parameters
    super.key,
    this.departureCity,
    this.arrivalCity,
    required this.passengerCount,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      // Uses a Stack to overlap widgets on top of each other
      children: [
        Container(
          // Background color
          color: StyleColor.promarySecondBlueColor, // Background color
          // Uses a custom extension to get 40% of the screen height & width
          width: context.getWidth(),
          height: context.getHeigth() * .4,
          child: Image.asset("assets/images/11.png", fit: BoxFit.fill),
        ),
        Positioned(
          top: 80,
          left: 30,
          child: Text(
            departureCity
                .toString(), // Displays the departureCity name (converted to string)
            style: Theme.of(context).textTheme.headlineSmall, //Theme of tet
          ),
        ),
        Positioned(
          //Positioned items
          top: 80,
          right: 30,
          child: Text(
            // Displays the arrival city name (converted to string)
            arrivalCity.toString(),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        Positioned(
          top: 75,
          left: 140,

          child: Text(
            "FlightDuration".tr(), // Uses easy_localization for translation
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        Positioned(
          top: 100,
          left: 160,
          child: Text(
            "FlightDuration2".tr(),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        Positioned(
          top:
              240, // Widget to display the airline name (translated) in the middle left
          left: 110,
          child: Text(
            "emiratesairline".tr(),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        Positioned(
          // Widget to display the airline logo to the left of the airline name
          top: 230,
          left: 30,
          child: SizedBox(
            width: 65,
            height: 65,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              clipBehavior: Clip.antiAlias,
              child: Image.asset("assets/images/7.png", fit: BoxFit.cover),
            ),
          ),
        ),
        Positioned(
          // Widget to display the ticket class "BusinessClass" below the airline name (translated)
          top: 270,
          left: 110,
          child: Text(
            "BusinessClass".tr(),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ), // Widget to display the ticket price in the middle right (translated)

        Positioned(
          top: 280,
          right: 40,
          child: Text(
            "12500 SAR".tr(),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ],
    );
  }
}
