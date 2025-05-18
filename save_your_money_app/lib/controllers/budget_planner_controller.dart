import 'dart:math';

import 'package:flutter/material.dart';

class BudgetPlannerController {
  final List<Color> colors = [
    Color(0xffa678f0),
    Color(0xff45aaf2),
    Color(0xff55efc4),
    Color(0xff81ecec),
    Color(0xfff6e58d),
    Color(0xffff7675),
    Color(0xfffab1a0),
    Color(0xfffd79a8),
    Color(0xffffeaa7),
  ];

  TextEditingController categoryController = TextEditingController();
  TextEditingController budgetController = TextEditingController();
  List<Map<String, String>> category = [
    {"name": "Food", "budget": "300"},
    {"name": "Transport", "budget": "150"},
    {"name": "Entertainment", "budget": "200"},
  ];

  List<double> usedAmounts = [];

  void generateRandomUsed() {
    usedAmounts =
        category.map((item) {
          double budget = double.tryParse(item["budget"].toString()) ?? 1.0;
          return Random().nextDouble() * budget;
        }).toList();
  }
}
