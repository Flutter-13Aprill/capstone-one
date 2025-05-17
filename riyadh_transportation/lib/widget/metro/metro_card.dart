import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riyadh_transportation/style/app_colors.dart';

class MetroCard extends StatelessWidget {
  const MetroCard({super.key});

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
          Icon(Icons.favorite, color: AppColors.primary),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/metroIcon.png",
                    width: 50,
                    height: 50,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    padding: EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Colors.deepOrange),
                    ),
                    child: Text(
                      "2",
                      style: TextStyle(
                        color: Colors.deepOrange,
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
                      Text("14", style: TextStyle(fontSize: 24)),
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
                        "7",
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
                "King Fahd Sport City",
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
