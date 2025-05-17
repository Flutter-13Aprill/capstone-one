import 'package:capstone/extensions/size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LeaderboardProfiles extends StatelessWidget {
  const LeaderboardProfiles({
    super.key,
    required this.setImage,
    required this.setName,
    required this.setScore,
  });
  final Widget setImage;
  final String setName;
  final String setScore;
  //here to set the players profiles in the leaderboard after finishing the game
  //the name and score will be setted after the game is finished in number_game.dart
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(),
      height: context.getHieght() * 0.08,
      decoration: BoxDecoration(color: const Color.fromARGB(255, 172, 173, 173),borderRadius: BorderRadius.circular(25)),
      child: Row(
        spacing: 16,
        children: [
          SizedBox(width: 6),
          Container(
            clipBehavior: Clip.hardEdge,
            width: 75,
            height: 75,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: setImage,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(setName, style: TextStyle(fontSize: 20,color: Colors.black)),
              Text('${'leaderboardScore'.tr()}: $setScore', style: TextStyle(fontSize: 14,color: Colors.black)),
            ],
          ),
        ],
      ),
    );
  }
}
