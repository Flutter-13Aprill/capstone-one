import 'package:flutter/material.dart';
import 'package:spotify_redesign/screens/song_screen.dart';

class HistoryListTile extends StatelessWidget {
  const HistoryListTile({
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
      child: ListTile(
        leading: Image.asset(songCover, scale: 0.5),
        title: Text(
          songName,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(songAuthor),
      ),
    );
  }
}
