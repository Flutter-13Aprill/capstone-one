import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:spotify_redesign/screens/song_screen.dart';

class SongContainer extends StatelessWidget {
  const SongContainer({
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
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => SongScreen(
                  songName: songName,
                  songAuthor: songAuthor,
                  songCover: songCover,
                ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SizedBox(
          height: 240,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 185, child: Image.asset(songCover)),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  songName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(songAuthor, style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
