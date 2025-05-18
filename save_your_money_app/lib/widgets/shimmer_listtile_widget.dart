// import 'package:flutter/material.dart';
// // import 'package:flutter_svg/svg.dart';
// import 'package:shimmer/shimmer.dart';

// // This widget creates a shimmer effect for a ListTile that is used as a placeholder during data loading.
// // - It shows a shimmer animation on the ListTile's icon and title to indicate loading state.
// // - The shimmer effect is applied using the `Shimmer.fromColors` widget with a custom base and highlight color for a glowing effect.
// class ShimmerListtileWidget extends StatelessWidget {
//   const ShimmerListtileWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//       baseColor: Colors.grey.shade700,
//       highlightColor: Colors.grey.shade100,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8),
//         child: ListTile(
//           leading: Icon(Icons.home),
//           title: Container(height: 16, width: 30, color: Colors.grey.shade700),
//         ),
//       ),
//     );
//   }
// }

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
