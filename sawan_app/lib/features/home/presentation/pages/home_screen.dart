import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sawan_app/core/text/text_style.dart';
import 'package:sawan_app/core/theme/app_palette.dart';
import 'package:sawan_app/features/home/presentation/widget/custom_drewer.dart';
import 'package:sawan_app/features/home/presentation/widget/custom_grid_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool loding = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        loding = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrewer(),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "welcome".tr(),
              style: TextStyles.alexandra700.copyWith(
                color: AppPalette.primeryColorBlue,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 40, 8, 8),
                child:
                    loding
                        ? Shimmer.fromColors(
                          baseColor: Colors.grey.shade800,
                          highlightColor: Colors.grey.shade600,
                          period: const Duration(seconds: 2),
                          child: Container(
                            width: 300,
                            height: 180,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        )
                        : Image.asset("assets/images/add.png"),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  loding
                      ? Shimmer.fromColors(
                        baseColor: const Color.fromARGB(255, 177, 177, 177),
                        highlightColor: Colors.grey.shade600,
                        period: const Duration(seconds: 2),
                        child: Container(
                          width: 120,
                          height: 20,
                          color: Colors.grey,
                        ),
                      )
                      : Text(
                        "Populer Watches".tr(),
                        style: TextStyles.alexandra700.copyWith(
                          color: AppPalette.primeryColorBlue,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.left,
                      ),
            ),

            CustomGridView(loading: loding),
          ],
        ),
      ),
    );
  }
}
