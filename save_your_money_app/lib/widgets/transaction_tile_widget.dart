import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:save_your_money_app/utils/extensions/screen/screen_size.dart';

class TransactionTileWidget extends StatelessWidget {
  final String name;
  final String time;
  final String amount;
  final bool isIncome;
  const TransactionTileWidget({
    super.key,
    required this.name,
    required this.time,
    required this.amount,
    required this.isIncome,
  });

  /// A widget that displays a transaction item with an avatar, name, time, and amount.

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Color(0xff628B35),
          maxRadius: 20,
          child: Text(
            name[0],
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        title: Text(
          name,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(time, style: TextStyle(color: Colors.grey)),
        trailing: SizedBox(
          width: context.getWidth(0.2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 2),
              Text(
                amount,
                style: TextStyle(
                  color: isIncome ? Colors.green : Colors.red,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              SizedBox(width: 8),
              SvgPicture.asset(
                "assets/icons/riyal.svg",
                height: 20,
                width: 20,
                colorFilter: ColorFilter.mode(
                  isIncome ? Colors.green : Colors.red,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
