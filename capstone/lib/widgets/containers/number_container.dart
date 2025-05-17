import 'dart:async';

import 'package:capstone/extensions/size.dart';
import 'package:capstone/screens/number_game.dart';
import 'package:flutter/material.dart';

class NumberContainer extends StatefulWidget {
  const NumberContainer({super.key, required this.value});
  final String value;

  @override
  State<NumberContainer> createState() => _NumberContainerState();
}

// here is the numbers contianers for the game

class _NumberContainerState extends State<NumberContainer> {
  Color nowColor = Colors.white;
  Color backGround = Colors.transparent;
  var isDisabled = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
      //if the number is correct will change the color to green and set background to grey
      //and make it unclickable
          isDisabled
              ? null
              : () {
                print('isCorrect.toString() == widget.value');
                if (gameController.isCorrect.toString() == widget.value) {
                  nowColor = Colors.green;
                  backGround = const Color.fromARGB(255, 80, 79, 79);
      

                  isDisabled = true;
                  setState(() {
                    gameController.correct();
                    print(gameController.isCorrect);
                    print(gameController.numberCorrect);
                  });
                  //if wrong will show the number in red because its incorrect 
                  //and then return it to white
                } else {
                  nowColor = Colors.red;
                  setState(() {});
                  Future.delayed(Duration(milliseconds: 500), () {
                    nowColor = Colors.white;
                    setState(() {});
                  });
                }

              },
      child: Container(
        alignment: Alignment.center,
        width: context.getWidth()*0.117,
        height: context.getHieght()*0.05252,
        decoration: BoxDecoration(
          color: backGround,
          border: Border.all(color: Colors.white),
        ),
        child: Text(
          widget.value,
          style: TextStyle(fontSize: 25, color: nowColor),
        ),
      ),
    );
  }
}
