import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ImgInSliver extends StatelessWidget {
  const ImgInSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.8,
      height: 150,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Opacity(
              opacity: 0.8,
              child: Image.asset('assets/images/sliver.png', fit: BoxFit.cover),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Buy one get one Free'.tr(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
