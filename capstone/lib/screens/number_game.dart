import 'dart:async';

import 'package:capstone/extensions/size.dart';
import 'package:capstone/widgets/controllers/game_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NumberGame extends StatefulWidget {
  const NumberGame({super.key});

  @override
  State<NumberGame> createState() => _NumberGameState();
}

//here where the number game is !!!

GameController gameController = GameController();

class _NumberGameState extends State<NumberGame> {
  @override
  void initState() {
    super.initState();
    //shuffle the containers to give player a challenge
    gameController.numbers.shuffle();

    //timer for the game
    Timer.periodic(Duration(seconds: 1), (timer) {
      gameController.countDown -= 1;
      setState(() {});

      //on 0 will reset everything and will show alertdialog for the player
      //it will display score and give the player an option to set name
      //the score and name will be send to leaderbaord
      if (gameController.countDown == 0) {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('timeup'.tr(), style: TextStyle(color: Colors.black)),
              content: Text(
                //show score
                '${'scored'.tr()}${gameController.numberCorrect}',
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                //give an option to enter name
                TextField(
                  style: TextStyle(color: Colors.black),
                  controller: gameController.controllerName,
                  decoration: InputDecoration(hintText: 'nameEnter'.tr()),
                ),
                //will add score and name to leaderboard
                ElevatedButton(
                  onPressed: () {
                    gameController.name = gameController.controllerName.text;
                    gameController.addScore(
                      gameController.numberCorrect,
                      gameController.name,
                      
                    );
                    //reset the gmae
                    gameController.rest();
                    Navigator.pop(context);
                    gameController.controllerName.clear();
                    dispose();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => NumberGame()),
                    );
                    setState(() {});
                  },
                  child: Text('alertButton'.tr()),
                ),
              ],
            );
          },
        );
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              gameController.rest();

              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Row(
                  spacing: 32,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${'time'.tr()} ${gameController.countDown}',
                      style: TextStyle(fontSize: 25),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        gameController.rest();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => NumberGame()),
                        );
                      },
                      child: Text('reset'.tr()),
                    ),
                  ],
                ),
                Container(
                  width: context.getWidth() * 0.875,
                  height: context.getHieght() * 0.785,
                  child: GridView.count(
                    crossAxisCount: 5,
                    physics: NeverScrollableScrollPhysics(),
                    //empty the list to the grid view
                    children: [...gameController.numbers],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
