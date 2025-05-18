import 'package:flutter/material.dart';
import 'package:spotify_redesign/widgets/home_widgets/song_container.dart';

class ContainersWrap extends StatelessWidget {
  const ContainersWrap({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 24,
              children: [
                SongContainer(
                  songName: "World of Walkers",
                  songAuthor: "Alan Walker",
                  songCover:
                      "assets/images/home_songs_images/Alan_Walker_1.jpg",
                ),
                SongContainer(
                  songName: "DarkSide",
                  songAuthor: "Alan Walker",
                  songCover:
                      "assets/images/home_songs_images/Alan_Walker_2.jpg",
                ),
                SongContainer(
                  songName: "The Spectre",
                  songAuthor: "Alan Walker",
                  songCover:
                      "assets/images/home_songs_images/Alan_Walker_3.jpg",
                ),
                SongContainer(
                  songName: "Walkerverse",
                  songAuthor: "Alan Walker",
                  songCover:
                      "assets/images/home_songs_images/Alan_Walker_4.jpg",
                ),
                SongContainer(
                  songName: "World of Walkers",
                  songAuthor: "Alan Walker",
                  songCover:
                      "assets/images/home_songs_images/Alan_Walker_1.jpg",
                ),
                SongContainer(
                  songName: "DarkSide",
                  songAuthor: "Alan Walker",
                  songCover:
                      "assets/images/home_songs_images/Alan_Walker_2.jpg",
                ),
                SongContainer(
                  songName: "The Spectre",
                  songAuthor: "Alan Walker",
                  songCover:
                      "assets/images/home_songs_images/Alan_Walker_3.jpg",
                ),
                SongContainer(
                  songName: "Walkerverse",
                  songAuthor: "Alan Walker",
                  songCover:
                      "assets/images/home_songs_images/Alan_Walker_4.jpg",
                ),
              ],
    );
  }
}