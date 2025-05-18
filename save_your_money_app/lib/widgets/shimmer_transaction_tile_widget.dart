import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTransactionTileWidget extends StatelessWidget {
  const ShimmerTransactionTileWidget({super.key});
  // ShimmerTransactionTileWidget shows a loading placeholder for a transaction item.

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade700,
      highlightColor: Colors.grey.shade500,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey.shade800,
            radius: 20,
            child: Container(color: Colors.grey.shade700), // مكان الحرف
          ),
          title: Container(height: 16, width: 150, color: Colors.grey.shade700),
          subtitle: Container(
            height: 14,
            width: 100,
            color: Colors.grey.shade700,
          ),
        ),
      ),
    );
  }
}
