import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class OrderProcessingScreen extends StatefulWidget {
  const OrderProcessingScreen({super.key});

  @override
  State<OrderProcessingScreen> createState() => _OrderProcessingScreenState();
}

class _OrderProcessingScreenState extends State<OrderProcessingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 80),
          Center(
            child: Image.asset('assets/images/Animation - 1747252702956.gif'),
          ),
          const SizedBox(height: 30),
          AnimatedTextKit(
            animatedTexts: [
              FadeAnimatedText(
                'thank_you_waiting'.tr(),
                textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                duration: Duration(seconds: 2),
              ),
              FadeAnimatedText(
                'order_on_the_way'.tr(),
                textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                duration: Duration(seconds: 2),
              ),
            ],
            repeatForever: true,
            isRepeatingAnimation: true,
          ),
        ],
      ),
    );
  }
}
