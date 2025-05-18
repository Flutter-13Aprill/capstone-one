import 'package:blood_donation/theems/color.dart';
import 'package:blood_donation/widgets/enter_widget/back_rectangle_class.dart';
import 'package:flutter/material.dart';

class BackgroundTheem extends StatelessWidget {
  const BackgroundTheem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          ClipPath(
            clipper: MyCustomClipper(),
            child: Image.asset("images/Rectangle.png"),
          ),

          ClipPath(
            clipper: MyCustomClipper(),
            child: Image.asset("images/back.png"),
          ),
          Positioned(
            left: 20,
            top: 150,
            child: Text("Blood Donation", style: TextStyle(fontSize: 30)),
          ),
          Positioned(
            left: 20,
            top: 200,
            child: Text(
              "Share drop to save life",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Positioned(
            left: 200,
            top: 150,
            child: Image.asset(
              "images/blood.png",
              height: 170,
              width: 200,
              color: myAppColor.redcolor,
            ),
          ),
        ],
      );
  }
}