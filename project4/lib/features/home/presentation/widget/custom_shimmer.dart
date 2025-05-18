import 'package:flutter/material.dart';
import 'package:project4/core/theme/app_palette.dart';
import 'package:project4/features/home/presentation/widget/receipt_grade_view.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppPalette.background1,
      highlightColor: AppPalette.labelText,
      enabled: true,
      period: Duration(milliseconds: 200),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Flexible(child: ReceiptGradeView()),
          ],
        ),
      ),
    );
  }
}
