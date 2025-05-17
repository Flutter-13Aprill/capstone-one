import 'package:capstone/widgets/containers/leaderboard_profiles.dart';
import 'package:capstone/widgets/containers/number_container.dart';
import 'package:flutter/material.dart';

//here where the magic happens here is the number game controllers

class GameController {
  //make list from 1 to 50 to numbers game
  List<Widget> numbers = List.generate(
    50,
    (index) => NumberContainer(value: (index + 1).toString()),
  );

 TextEditingController nameController = TextEditingController();
  bool hasText = false;
  List<LeaderboardProfiles> attempts = [];
  int countDown = 60;
  int numberCorrect = 0;
  int isCorrect = 1;
  TextEditingController controllerName = TextEditingController();
  String name = '';
  //if the number is correct will be added to scored and set the next correct number
  void correct() {
    numberCorrect++;
    isCorrect++;
  }

// will add the score to leaderboard
  void addScore(int score, String name) {
    
    if (countDown == 0) {
      attempts.add(
        LeaderboardProfiles(
          setImage: Icon(Icons.person),
          setName: name,
          setScore: score.toString(),
        ),
      );
      sorter();
    }
  }
      //sort scores by highest score
  void sorter(){
    attempts.sort(
      (LeaderboardProfiles b, LeaderboardProfiles a) =>
          a.setScore.compareTo(b.setScore),
    );
  }

//for resting the values
  void rest() {
    numbers.shuffle();
    numberCorrect = 0;
    countDown = 60;
    isCorrect = 1;
  }
}
