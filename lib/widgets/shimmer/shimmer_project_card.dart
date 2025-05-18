import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:project_flow/Theme/app_colors.dart';

class ShimmerProjectCard extends StatelessWidget {
  final bool isActive;
  
  const ShimmerProjectCard({
    super.key,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor:  AppColors.deepPurple,
      highlightColor:AppColors.surfaceDark,
      period: const Duration(milliseconds: 1500), 
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color:  const Color.fromARGB(66, 255, 255, 255),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(21),
        width: 260,
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title placeholder
            Container(
              width: 120,
              height: 20,
              decoration: BoxDecoration(
                color:AppColors.surfaceDark,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 8),
            
            // Subtitle placeholder
            Container(
              width: 80,
              height: 12,
              decoration: BoxDecoration(
                color:AppColors.surfaceDark,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const Spacer(),
            
            // Bottom row placeholder
            Row(
              children: [
                // Check icon placeholder
                Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.background,
                  ),
                ),
                const SizedBox(width: 8),
                
                // Avatars placeholder
                ...List.generate(4, (index) => Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color:  AppColors.background,
                    ),
                  ),
                )),
                const SizedBox(width: 12),
                
                // Progress placeholder
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 60,
                        height: 12,
                        decoration: BoxDecoration(
                          color:  AppColors.background,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 6,
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}