import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListViewWidget extends StatelessWidget {
  const ShimmerListViewWidget({super.key});
  // Shimmer effect placeholder for a ListView item,

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade700,
        highlightColor: Colors.grey.shade500,
        child: Container(
          height: 40,
          width: 140,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Color(0xff252836)),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            color: Color(0xff252836),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 16,
              right: 16,
              bottom: 4,
            ),
            child: Column(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(height: 2),
                Container(width: 60, height: 10, color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
