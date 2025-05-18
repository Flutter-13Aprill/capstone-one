import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimeerBox extends StatelessWidget {
  const ShimeerBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left:  8.0),
        child: Container(
          width: 190,
          height: 190,
          color: Theme.of(context).primaryColor,
        
        ),
      ),
    );
  }
}