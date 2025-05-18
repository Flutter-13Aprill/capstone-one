import 'package:capstone1/Helpers/screen_extinsion.dart';
import 'package:capstone1/Styling/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({
    super.key,
    required this.imagePath,
    required this.category,
    required this.active,
  });
  final String imagePath;
  final String category;

  final bool active;

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  bool shimmeractive = true;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        shimmeractive = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      height: context.screenHeight * 0.1,
      width: context.screenHeight * 0.1,
      decoration: BoxDecoration(
        color: widget.active ? oceanBlue : lightBlue,

        borderRadius: BorderRadius.circular(24),
      ),

      padding: const EdgeInsets.all(16),
      child: Image.asset(
        widget.imagePath,
        height: 40,
        width: 40,

        fit: BoxFit.scaleDown,
      ),
    );
    return Column(
      children: [
        shimmeractive
            ? Shimmer.fromColors(
              child: content,
              baseColor: lightBlue,
              highlightColor: oceanBlue,
            )
            : content,
        const SizedBox(height: 8),
        Text(
          widget.category,
          style: TextStyle(
            color: darkModeGreen,
            fontFamily: "Subtitle",
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
