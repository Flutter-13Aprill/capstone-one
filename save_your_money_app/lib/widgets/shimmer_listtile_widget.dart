import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListtileWidget extends StatelessWidget {
  const ShimmerListtileWidget({super.key});
  // ShimmerListtileWidget shows a shimmer loading placeholder for a ListTile

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 350,
      decoration: BoxDecoration(
        color: const Color(0xff252836),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade800,
        highlightColor: Colors.grey.shade600,
        child: ListTile(
          leading: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          title: Container(width: 200, height: 14, color: Colors.grey),
        ),
      ),
    );
  }
}
