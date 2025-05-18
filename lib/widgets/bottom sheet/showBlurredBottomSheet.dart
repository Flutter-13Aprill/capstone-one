import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_flow/widgets/bottom%20sheet/project_bottomSheet_widget.dart';
import 'package:project_flow/widgets/bottom%20sheet/task_bottomsheet_widget.dart';

void showBlurredBottomSheet(BuildContext context,{bool project=true}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withOpacity(0.5),
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: project? const ProjectBottomsheetWidget():TaskBottomSheet(),
        ),
      );
    },
  );
}
