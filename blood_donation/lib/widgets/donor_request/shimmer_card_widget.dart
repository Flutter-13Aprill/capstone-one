import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'card_homa_widget.dart';
//shimmer affect
class ShimmerCardWidget extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback? onTap;

  const ShimmerCardWidget({
    super.key,
    required this.imagePath,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.white70,
      child: InkWell(
        onTap: onTap,
        child: CardHomaWidget(
          images: imagePath,
          text: text,
        ),
      ),
    );
  }
}