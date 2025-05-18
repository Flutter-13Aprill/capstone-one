import 'package:flutter/material.dart';

class EntryTextButton extends StatelessWidget {
  const EntryTextButton({
    super.key,
    required this.whiteText,
    required this.coloredText,
    required this.destination,
  });

  final String whiteText;
  final String coloredText;
  final Widget destination;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: RichText(
        text: TextSpan(
          text: "$whiteText ?  ",
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(text: coloredText, style: TextStyle(color: Colors.amber)),
          ],
        ),
      ),
    );
  }
}
