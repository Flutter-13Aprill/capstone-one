import 'package:flutter/material.dart';
import 'package:project_flow/Theme/app_colors.dart';
import 'package:project_flow/controllers/onBording_controller.dart';

import 'package:project_flow/widgets/circleDot_widget.dart';

class OnbordingView extends StatefulWidget {
  const OnbordingView({super.key});

  @override
  State<OnbordingView> createState() => _OnbordingViewState();
}

class _OnbordingViewState extends State<OnbordingView> {
  late OnbordingController onbordingController = OnbordingController(
    context: context,
  );

  @override
  Widget build(BuildContext context) {
    String imagePath =
        "assets/onBording/image${onbordingController.currentPage + 1}.png";
    return Scaffold(
      body: Container(
        clipBehavior: Clip.none,
        color: onbordingController.togleBackgoundColor(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: (MediaQuery.sizeOf(context).height / 2),
              width: (MediaQuery.sizeOf(context).width),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage(imagePath),
                ),
              ),
            ),
            // container onbording
            Container(
              // padding: EdgeInsets.only(left: 16,top: 16,right: 0),
              // padding: EdgeInsets.all(16),
              height: (MediaQuery.sizeOf(context).height / 2) - 30,
              width: (MediaQuery.sizeOf(context).width),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 4,
                    children: [
                      ...List.generate(
                        onbordingController.views.length,
                        (index) => CircleDot(
                          isActive: onbordingController.currentPage == index,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16),

                  Expanded(
                    child: PageView.builder(
                      itemCount: onbordingController.views.length,
                      controller: onbordingController.moveTo,
                      onPageChanged: (value) {
                        setState(() {
                          onbordingController.currentPage = value;
                          // print(
                          //   "onPageChanged ${onbordingController.currentPage} lenth=${onbordingController.views.length}",
                          // );
                        });
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return onbordingController.views[index];
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
