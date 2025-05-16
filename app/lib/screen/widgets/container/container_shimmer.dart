import 'package:app/extension/Screen/get_size_screen.dart';
import 'package:app/theme/style_color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// Defines a StatefulWidget called ContainerShimmer

class ContainerShimmer extends StatefulWidget {
  const ContainerShimmer({
    super.key,
  }); // Constructor for the ContainerShimmer widget

  @override
  State<ContainerShimmer> createState() => _ContainerShimmerScreenState();
}

class _ContainerShimmerScreenState extends State<ContainerShimmer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:
          context
              .getWidth(), // Sets the width of the SizedBox to the screen width using a custom extension
      height:
          context.getHeigth() *
          .4, // Sets the width of the SizedBox to the screen width using a custom extension

      child: Shimmer.fromColors(
        // Uses the Shimmer widget to apply a shimmering effect
        baseColor:
            StyleColor
                .primaryGrayeColor, // Sets the base color of the shimmer effect
        highlightColor:
            StyleColor
                .primarBoldGrayyeColor, // Sets the highlight color of the shimmer effect
        child: Container(
          // Sets the highlight color of the shimmer effect
          width: context.getWidth(),
          height:
              context.getHeigth() *
              .4, // Sets the highlight color of the shimmer effect

          // Sets the color of the inner Container (this color will be covered by the shimmer effect)
          color: StyleColor.primarBoldGrayyeColor,
        ),
      ),
    );
  }
}
