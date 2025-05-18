import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isClicked;
  const ListViewWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.isClicked,
  });
  // A customizable list item with an icon and localized title,
  // highlights border color when selected (isClicked = true).

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Container(
        height: 50,
        width: 160,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color:
                isClicked
                    ? (Theme.of(context).textTheme.bodyLarge!.color)!
                    : (Theme.of(context).cardColor),
          ),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).cardColor,
        ),

        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 4),
          child: Column(
            children: [
              Icon(icon, color: Theme.of(context).textTheme.bodyLarge?.color),
              SizedBox(height: 2),

              Text(
                title.tr(),
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
