import 'package:flutter/material.dart';
import 'package:jojo_bakery/widgets/build_text.dart';

class OnBoardingTwo extends StatefulWidget {
  const OnBoardingTwo({super.key});

  @override
  State<OnBoardingTwo> createState() => _OnBoardingTwoState();
}

class _OnBoardingTwoState extends State<OnBoardingTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset(height: 550, "assets/images/pic3.jpg", fit: BoxFit.fill),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: buildTextWidget(
              "كل خبزة ... قصة طازجة",
              18,
              Colors.grey[900],
              isBold: true,
            ),
          ),
          SizedBox(height: 5),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "كل قطعة هنا تصنع بحب و اتقان .. لتقدم لك\n",
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                TextSpan(
                  text: "تجربة طازجة و مميزه ",
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
