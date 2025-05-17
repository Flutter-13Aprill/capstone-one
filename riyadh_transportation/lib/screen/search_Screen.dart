import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riyadh_transportation/controller/buss_Controller.dart';
import 'package:riyadh_transportation/style/app_colors.dart';
import 'package:riyadh_transportation/widget/bus/bus_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: TextField(
            onChanged: (value) {
              BussController.busSearch(value);
              setState(() {});
            },
            decoration: InputDecoration(
              label: Text("Search").tr(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: Icon(Icons.search, color: AppColors.primary),
            ),
          ),
        ),
        SizedBox(height: 8),

        Expanded(
          child: ListView(
            children: [
              SizedBox(height: 8),
              ...List.generate(BussController.listWithbuss.length, (index) {
                return InkWell(
                  onTap: () {
                    BussController.busfav(index);

                    setState(() {});
                  },
                  child: BusCard(
                    isFavorite:
                        BussController.listWithbuss[index]["isFavorite"],
                    line: BussController.listWithbuss[index]["line"],
                    time: BussController.listWithbuss[index]["time"],
                    nextTime: BussController.listWithbuss[index]["nextTime"],
                    stationName:
                        BussController.listWithbuss[index]["stationName"],
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
