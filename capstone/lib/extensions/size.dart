import 'package:flutter/material.dart';

//here is to get screen height and width

extension Size on BuildContext{

double getWidth(){

  return MediaQuery.sizeOf(this).width;
}
double getHieght(){


  return MediaQuery.sizeOf(this).height;
}

}