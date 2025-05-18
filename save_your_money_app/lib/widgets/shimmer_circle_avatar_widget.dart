import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCircleAvatarWidget extends StatelessWidget {
  const ShimmerCircleAvatarWidget({super.key});
  // Shimmer effect placeholder widget for a circular avatar and a text bar below it,

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.shade700,
          highlightColor: Colors.grey.shade100,
          child: CircleAvatar(
            backgroundColor: Color(0xffc8d9e6),
            maxRadius: 70,
            child: Image.asset("assets/images/profile.png", height: 100),
          ),
        ),
        SizedBox(height: 16),

        Shimmer.fromColors(
          baseColor: Colors.grey.shade700,
          highlightColor: Colors.grey.shade100,

          child: Container(height: 10, width: 60, color: Colors.grey.shade700),
        ),
      ],
    );
  }
}
