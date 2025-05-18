import 'package:capstone1/Controllers/balance_header_controller.dart';
import 'package:capstone1/Styling/colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class GoalsCard extends StatelessWidget {
  const GoalsCard({super.key, required this.balanceHeaderController});
  final BalanceHeaderController balanceHeaderController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: mainGreen,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          // Circular percent indicator with a car icon
          CircularPercentIndicator(
            radius: 40,
            lineWidth: 3.25,
            percent: balanceHeaderController.getProgressPercent(),
            backgroundColor: Colors.white,
            progressColor: Colors.blueAccent,
            circularStrokeCap: CircularStrokeCap.round,
            animation: true,
            center: Icon(Icons.directions_car, size: 32, color: darkModeGreen),
          ),

          SizedBox(width: 16),
          // Divider
          VerticalDivider(color: Colors.white, thickness: 1),
          SizedBox(width: 16),

          // Revenue & food info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Revenue Last Week",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                SizedBox(height: 4),
                Text(
                  balanceHeaderController.getIncome(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 12),
                Divider(color: Colors.white),
                SizedBox(height: 12),
                Text(
                  "Food Last Week",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                SizedBox(height: 4),
                Text(
                  "-\$100.00",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
