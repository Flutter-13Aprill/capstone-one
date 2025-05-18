import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:save_your_money_app/utils/extensions/screen/screen_size.dart';

class InfoCardWidget extends StatelessWidget {
  final String title;
  final String value;

  const InfoCardWidget({super.key, required this.title, required this.value});
  // A compact info card displaying a title and value with a currency icon.

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getHeight(0.15),
      width: context.getWidth(0.44),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).cardColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/riyal.svg",
                height: 40,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              SizedBox(width: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
