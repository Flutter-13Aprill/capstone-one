import 'package:flutter/widgets.dart';
import 'package:sawan_app/core/function/navigation.dart';

import 'package:sawan_app/features/onbording/data/onbording_model.dart';
import 'package:sawan_app/features/outh/presentation/pages/sign_in_screen.dart';

class OnbordingController {
  final PageController controller = PageController();
  int currentPage = 0;
  void cheeckNavigation(BuildContext context, int index) {
    if (index == onbordingData.length - 1) {
      customReplacmentNaviagte(context, SignInScreen());
    }
    controller.nextPage(
      duration: Duration(microseconds: 200),
      curve: Curves.easeIn,
    );
  }
}
