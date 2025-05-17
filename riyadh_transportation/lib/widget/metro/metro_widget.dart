import 'package:flutter/material.dart';
import 'package:riyadh_transportation/widget/metro/metro_card.dart';

class MetroWidget extends StatelessWidget {
  const MetroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [MetroCard()]);
  }
}
