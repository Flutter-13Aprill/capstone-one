import 'package:blood_donation/exstenshon/exstenshon.dart';
import 'package:blood_donation/theems/color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RequestDetailSheet extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onDonate;

  const RequestDetailSheet({
    super.key,
    required this.item,
    required this.onDonate,
  });

  @override
  Widget build(BuildContext context) {
    final int remaining = int.tryParse(item['donationNeeded'].toString()) ?? 0;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(color: myAppColor.graycolor),
        width: context.getWidth(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "File #: ${item['file'].toString()}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text("City: ${item['city'].toString() ?? "not defind"}"),
            Text("Hospital: ${item['hospital'].toString()}"),
            Text("Blood Type: ${item['blood'].toString()}"),
            Text("Case: ${item['state'].toString()}"),
            Text("Donation Neded: $remaining"),
            SizedBox(height: 16),
            remaining > 0
                ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: onDonate,
                  child: Text(
                    "interested_donation".tr(),
                    style: TextStyle(color: myAppColor.whitecolor),
                  ),
                )
                : Text(
                  "interest_noted".tr(),
                  style: TextStyle(
                    color: myAppColor.redcolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
