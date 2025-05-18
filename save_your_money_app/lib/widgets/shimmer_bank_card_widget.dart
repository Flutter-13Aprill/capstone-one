import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBankCardWidget extends StatelessWidget {
  const ShimmerBankCardWidget({super.key});
  // A shimmer effect placeholder widget for bank cards,

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade700,
      highlightColor: Colors.grey.shade500,
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[800],
        ),
        margin: EdgeInsets.symmetric(vertical: 8),
      ),
    );
  }
}
