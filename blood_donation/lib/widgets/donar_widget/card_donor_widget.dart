import 'package:blood_donation/theems/color.dart';
import 'package:flutter/material.dart';

class RequestCardWidget extends StatelessWidget {
  final String file;
  final String city;
  final VoidCallback onTap;

  const RequestCardWidget({
    super.key,
    required this.file,
    required this.city,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        "images/bloodbag1.png",
        height: 50,
        color: myAppColor.redcolor,
      ),
      title: Text("File #: $file"),
      subtitle: Text("Place: $city"),

      onTap: onTap,
    );
  }
}
