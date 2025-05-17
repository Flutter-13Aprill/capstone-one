import 'package:capstone/extensions/size.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GamesShimmer extends StatelessWidget {
  const GamesShimmer({super.key});

// shimmer for games in home screen

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: UnconstrainedBox(
        child: Container(
          width: context.getWidth() * 0.352,
          height: context.getHieght() * 0.157,
          decoration: BoxDecoration(
            color: Colors.grey,

            borderRadius: BorderRadius.circular(10),
            
          ),

        ),

      ),
    );
  }
}
