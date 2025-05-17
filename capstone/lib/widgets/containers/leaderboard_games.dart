import 'package:capstone/extensions/size.dart';
import 'package:flutter/material.dart';

class LeaderboardGames extends StatelessWidget {
  const LeaderboardGames({super.key, required this.setGame});

  final String setGame;

//leaderboard games tabs 

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        width: context.getWidth()* 0.29,
        height: context.getHieght()*0.026,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 172, 173, 173),
          borderRadius: BorderRadius.circular(25),
          
        ),
        child: Text(setGame,textAlign: TextAlign.center,),
      ),
    );
  }
}
