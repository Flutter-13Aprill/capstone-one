import 'package:flutter/material.dart';

class CircleAvatarWidget extends StatelessWidget {
  final String imagePath;

  const CircleAvatarWidget({super.key, required this.imagePath});
  // Widget displaying a profile avatar with an edit icon and username below.

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              backgroundColor: Color(0xff252836),
              maxRadius: 70,
              child: Image.asset(imagePath, height: 100),
            ),

            Positioned(
              right: 4,
              bottom: 6,
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Color(0xffE2DBD0),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.edit_outlined, color: Color(0xff252836)),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),

        Text(
          "Remas Alnugaithan",
          style: TextStyle(
            color: Color(0xffE2DBD0),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
