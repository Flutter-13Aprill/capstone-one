import 'package:flutter/material.dart';

// -- External Package 
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

// -- App Theming 
import 'package:shabah/style/app_colors.dart';

class ShimmerEffect extends StatefulWidget {
  const ShimmerEffect({super.key});

  @override
  State<ShimmerEffect> createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<ShimmerEffect> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (isLoading) {

          

          Future.delayed(Duration(seconds: 1),(){
            setState(() {
              isLoading = false;
            });
          });
          return Shimmer.fromColors(
            baseColor: AppColors.shimmerColor,
            highlightColor: AppColors.includedChipTextColor,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          );

        }

        return Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.5),
                blurRadius: 4,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: SvgPicture.asset(
            'assets/profile_screen/svgs/falcon.svg',
            color: AppColors.tertiaryColor,
          ),
        );
      },
    );
  }
}
