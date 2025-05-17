import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:sawan_app/core/text/text_style.dart';
import 'package:sawan_app/core/widget/custom_tab_bar.dart';
import 'package:sawan_app/features/watch%20product/data/tab_bar_size_model.dart';

class CustomWatchDescr extends StatelessWidget {
  const CustomWatchDescr({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        child: Stack(
          children: [
            Stack(children: [Image.asset("assets/images/watchdes.png")]),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 50, 30, 30),
                child: Text(
                  textAlign: TextAlign.end,
                  "watchdescreption".tr(),
                  style: TextStyles.alexandra700.copyWith(fontSize: 18),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 190, 30, 30),
                child: Center(
                  child: CustomTapBarr(
                    length: sizeData.length,
                    dataModel: sizeData,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 150, 30, 30),
                child: Text(
                  textAlign: TextAlign.end,
                  "size".tr(),
                  style: TextStyles.alexandra700.copyWith(fontSize: 18),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 50, 30, 30),
                child: Text(
                  textAlign: TextAlign.end,
                  "watchdescreption".tr(),
                  style: TextStyles.alexandra700.copyWith(fontSize: 18),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 250, 30, 30),
                child: Text(
                  textAlign: TextAlign.end,
                  "detailhead".tr(),
                  style: TextStyles.alexandra700.copyWith(fontSize: 18),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 290, 30, 30),
                child: Text(
                  textAlign: TextAlign.end,
                  "detail".tr(),
                  style: TextStyles.alexandra400size14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
