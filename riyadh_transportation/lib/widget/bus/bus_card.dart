import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riyadh_transportation/style/app_colors.dart';

class BusCard extends StatelessWidget {
  final String isFavorite;
  final int line;
  final int time;
  final int nextTime;
  final String stationName;

  const BusCard({
    super.key,
    required this.line,
    required this.time,
    required this.nextTime,
    required this.stationName,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          isFavorite == "true"
              ? Icon(Icons.favorite, color: AppColors.primary)
              : Icon(Icons.favorite_border),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/busIcon.png",
                    width: 60,
                    height: 60,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: AppColors.primary),
                    ),
                    child: Text(
                      "$line",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text("$time", style: TextStyle(fontSize: 24)),
                      Text(
                        "mins",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ).tr(),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "$nextTime",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      Text(
                        "mins",
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ).tr(),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Text(
                stationName,
                //Al-Khaleej Station 513
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ).tr(),
            ],
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
