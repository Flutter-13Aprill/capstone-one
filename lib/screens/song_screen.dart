import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SongScreen extends StatelessWidget {
  const SongScreen({
    super.key,
    required this.songName,
    required this.songAuthor,
    required this.songCover,
  });

  final String songName;
  final String songAuthor;
  final String songCover;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
      backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_circle_left_outlined, color: Colors.white),
        ),
        centerTitle: true,
        title: Text(
          "Now Playing".tr(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(songCover, scale: 0.75),
            ),
          ),

          SizedBox(height: 32),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              songName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              songAuthor,
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
          SizedBox(height: 64),
          Center(child: Image.asset("assets/images/song_progress_bar.png")),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("2:25", style: TextStyle(color: Colors.white)),
                Text("-2:25", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          SizedBox(height: 48),
          Center(child: Image.asset("assets/images/song_buttons.png")),
        ],
      ),
    );
  }
}
