import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_flow/Theme/app_colors.dart';
import 'package:project_flow/view/signin_view/signin_view.dart';
import 'package:project_flow/view/onbording/view_1_.dart';

import 'package:project_flow/widgets/onbording_sub_widget.dart';

class OnbordingController {
  // Function getStarted;
  OnbordingController({required this.context});
  final BuildContext context;
  int currentPage = 0;
  PageController moveTo = PageController(initialPage: 0);
  nextPage() {
    if (currentPage < views.length - 1) {
      currentPage = currentPage + 1;
      moveTo.jumpToPage(currentPage);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (builder) => SigninView()),
      );
    }
  }

  skip() {
    currentPage = views.length;
    moveTo.jumpToPage(currentPage);
  }

  List<Widget> get views => [
        View1(nextPage: nextPage),
        OnbordingSubWidget(
          nextPage: nextPage,
          title: "onBording.v2.t1".tr(),
          subTitle: "onBording.v2.t2".tr() ,
          skip: skip,
        ),
        OnbordingSubWidget(
          nextPage: nextPage,
          title: "onBording.v3.t1".tr() ,
          subTitle:"onBording.v3.t2".tr() ,
          skip: skip,
        ),
        OnbordingSubWidget(
          nextPage: nextPage,
          title:  "onBording.v4.t1".tr(),
          subTitle: "onBording.v3.t2".tr() ,
          skip: skip,
        ),
      ];

  togleBackgoundColor() =>
      currentPage != 0 ? AppColors.background : AppColors.deepPurple;
}
