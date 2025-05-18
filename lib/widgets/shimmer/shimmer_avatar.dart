import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget shimmerAvatarWidget() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[800]!,
    highlightColor: Colors.grey[700]!,
    child: CircleAvatar(
      minRadius: 80,

      backgroundColor: Color.from(alpha: 1, red: 0.145, green: 0.157, blue: 0.212),
      child: Image.asset("assets/users/person1.png"),
    ),
  );
}
