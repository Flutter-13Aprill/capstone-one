import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BankCardWidget extends StatelessWidget {
  final String cardNumber;
  final String expirationDate;
  final int index;

  BankCardWidget({
    super.key,
    required this.cardNumber,
    required this.expirationDate,
    required this.index,
  });
  // Custom widget for displaying a styled bank card with number and expiration date.

  final List<List<Color>> colors = [
    [Color(0xff654ea3), Color(0xffeaafc8)],
    [Color(0xff0f2027), Color(0xff2c5364)],
    [Color(0xff11998e), Color(0xff38ef7d)],
    [Color(0xff1E3C72), Color(0xff2A5298)],
    [Color(0xffe52d27), Color(0xffb31217)],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: index >= colors.length ? colors[0] : colors[index],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Text(
              "VISA",
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
          Text(
            cardNumber,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              letterSpacing: 2.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "card_holder".tr(),
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Remas Alnugaithan",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "expires".tr(),
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    expirationDate,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
