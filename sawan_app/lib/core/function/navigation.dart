import 'package:flutter/material.dart';

void customReplacmentNaviagte(context, Widget path) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => path),
  );
}

void customPush(context, Widget path) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => path));
}
