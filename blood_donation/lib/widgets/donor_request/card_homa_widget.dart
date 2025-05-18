import 'package:blood_donation/theems/color.dart';
import 'package:flutter/material.dart';

class CardHomaWidget extends StatefulWidget {
  const CardHomaWidget({super.key, required this.images, required this.text});
  final String images;
  final String text;
  @override
  State<CardHomaWidget> createState() => _CardHomaWidgetState();
}

class _CardHomaWidgetState extends State<CardHomaWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 100,
        width: 110,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: myAppColor.whitecolor,
        ),
        child: Column(
          children: [
            Image.asset(widget.images, fit: BoxFit.contain),
            SizedBox(height: 8),
            Text(widget.text, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
