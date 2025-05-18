import 'package:flutter/material.dart';

void customPushReplacement(context, Widget path) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => path),
  );
}

void customPush(context, Widget path) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => path));
}

void customPop(context) {
  Navigator.pop(context);
}
