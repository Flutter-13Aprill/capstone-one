import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmerCardWidget extends StatelessWidget {
  // Constructor for the HomeShimmerCardWidget
  const HomeShimmerCardWidget({super.key});
  @override
  Widget build(BuildContext context) {
    // Shimmer effect for loading skeleton
    return Shimmer.fromColors(
      baseColor: Color(0xFF3E3366), // Base color for shimmer effect
      highlightColor: Color(0xFF7C5DFF), // Highlight color for shimmer effect
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Placeholder for image with shimmer effect
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: Colors.grey[850], // Placeholder background color
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
          ),
          SizedBox(height: 10), // Space between image and text
          // Placeholder for title
          Container(
            width: 140,
            height: 14,
            color: Colors.grey[850], // Placeholder background color
          ),
          SizedBox(height: 6), // Space between title and description
          // Placeholder for description
          Container(
            width: 100,
            height: 14,
            color: Colors.grey[850], //  background color
          ),
        ],
      ),
    );
  }
}
