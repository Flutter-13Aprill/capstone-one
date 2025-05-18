import 'package:flutter/material.dart';

extension Size on BuildContext{
  double getWidth(){
    return MediaQuery.sizeOf(this).width;
  }
  double getHeight(){
    return MediaQuery.sizeOf(this).height;
  }
}