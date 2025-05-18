import 'package:flutter/material.dart';

extension ScreenSize on BuildContext {
  // Extension on BuildContext to easily get screen height and width
  // based on a fraction (factor) of the screen size.
  getHeight(double factor) {
    return MediaQuery.sizeOf(this).height * factor;
  }

  getWidth(double factor) {
    return MediaQuery.sizeOf(this).width * factor;
  }
}
