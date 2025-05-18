import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:save_your_money_app/utils/extensions/screen/screen_size.dart';

class ShimmerInfoCardWidget extends StatelessWidget {
  const ShimmerInfoCardWidget({super.key});
  // Shimmer effect placeholder widget for an InfoCard,

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade700,
      highlightColor: Colors.grey.shade500,
      child: Container(
        height: context.getHeight(0.15),
        width: context.getWidth(0.44),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade800,
        ),
      ),
    );
  }
}
