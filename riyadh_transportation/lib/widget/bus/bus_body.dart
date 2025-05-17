import 'package:flutter/material.dart';
import 'package:riyadh_transportation/controller/buss_Controller.dart';
import 'package:riyadh_transportation/widget/bus/bus_card.dart';

class BusBody extends StatefulWidget {
  const BusBody({super.key});

  @override
  State<BusBody> createState() => _BusBodyState();
}

class _BusBodyState extends State<BusBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 8),
        ...List.generate(BussController.allBuss.length, (index) {
          if (BussController.allBuss[index]["isFavorite"] == "true") {
            return InkWell(
              onTap: () {
                BussController.busfav(index);

                setState(() {});
              },
              child: BusCard(
                isFavorite: BussController.allBuss[index]["isFavorite"],
                line: BussController.allBuss[index]["line"],
                time: BussController.allBuss[index]["time"],
                nextTime: BussController.allBuss[index]["nextTime"],
                stationName: BussController.allBuss[index]["stationName"],
              ),
            );
          }
          return SizedBox();
        }),
      ],
    );
  }
}
