import 'package:flutter/material.dart';
import 'package:jojo_bakery/widgets/build_text.dart';

class OnBoardingOne extends StatefulWidget {
  const OnBoardingOne({super.key});

  @override
  State<OnBoardingOne> createState() => _OnBoardingOneState();
}

class _OnBoardingOneState extends State<OnBoardingOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset("assets/images/pic1.jpg", height: 550, fit: BoxFit.cover),

          Padding(
            padding: EdgeInsets.only(top: 20),
            child: buildTextWidget(
              "مرحبا بك في عالم المخبوزات الفاخره",
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
                  text: "استمتع بتجربة لذيذه لأطعم المخبوزات والحلويات\n",
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                TextSpan(
                  text: "طازجة و بجودة استثنائية",
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
