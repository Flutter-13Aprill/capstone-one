import 'package:capstone/extensions/size.dart';
import 'package:capstone/screens/number_game.dart';
import 'package:capstone/widgets/containers/leaderboard_games.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

//here is leaderboard show game catagory 
//show profile for players sorted by highest score

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            alignment: Alignment.center,
            child: Text('appbarLeaderboard'.tr()),
          ),
        ),
        body: Column(
          children: [
            TabBar(indicatorColor: Colors.black,
           labelColor: Colors.black,
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              //game taps
              tabs: [
                LeaderboardGames(setGame: 'numbersGame'.tr()),
                LeaderboardGames(setGame: 'soon'.tr()),
                LeaderboardGames(setGame: 'soon'.tr()),
                LeaderboardGames(setGame: 'soon'.tr()),
                LeaderboardGames(setGame: 'soon'.tr()),
              ],
            ),
            SizedBox(height: 25),
            SizedBox(
              height: context.getHieght() * 0.7,
              width: context.getWidth()*0.95,
              child: SingleChildScrollView(
                child: Column(spacing: 16,
                //empty the profiles from controller
                  children: [
                    ... gameController.attempts
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
