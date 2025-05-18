import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:spotify_redesign/widgets/collections/navigation_bar_destinations.dart';
import 'package:spotify_redesign/widgets/history_widgets/history_list_tile.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int buttomNavigationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
      backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text("History".tr(), style: TextStyle(color: Colors.white)),
      ),

      bottomNavigationBar: NavigationBar(
        backgroundColor: Color.fromARGB(255, 51, 51, 51),
        indicatorColor: Colors.green,
        overlayColor: WidgetStateProperty.all(Colors.white),
        labelTextStyle: WidgetStateProperty.all(TextStyle(color: Colors.white)),
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.history_outlined, color: Colors.white),
            label: "History".tr(),
          ),
          NavigationDestination(
            icon: Icon(Icons.home_filled, color: Colors.white),
            label: "Home".tr(),
          ),
          NavigationDestination(
            icon: Icon(Icons.person, color: Colors.white),
            label: "Profile".tr(),
          ),
        ],
        selectedIndex: buttomNavigationIndex,
        onDestinationSelected: (value) {
          setState(() {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => navigationDestination[value],
              ),
            );
          });
        },
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:  24),
              child: Text(
                "Recently Played".tr(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
                      SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  children: [
                    HistoryListTile(
              songName: "World of Walkers",
              songAuthor: "AlanWalker",
              songCover: "assets/images/home_songs_images/Alan_Walker_1.jpg",
            ),
                      Divider(color: Colors.green,),
        
            HistoryListTile(
              songName: "DarkSide",
              songAuthor: "AlanWalker",
              songCover: "assets/images/home_songs_images/Alan_Walker_2.jpg",
            ),
            Divider(color: Colors.green,),
            HistoryListTile(
              songName: "The Spectre",
              songAuthor: "AlanWalker",
              songCover: "assets/images/home_songs_images/Alan_Walker_3.jpg",
            ),
                      Divider(color: Colors.green,),
        
            HistoryListTile(
              songName: "Walkverse",
              songAuthor: "AlanWalker",
              songCover: "assets/images/home_songs_images/Alan_Walker_4.jpg",
            ),
                      Divider(color: Colors.green,),
        
            HistoryListTile(
              songName: "World of Walkers",
              songAuthor: "AlanWalker",
              songCover: "assets/images/home_songs_images/Alan_Walker_1.jpg",
            ),
                      Divider(color: Colors.green,),
        
            HistoryListTile(
              songName: "DarkSide",
              songAuthor: "AlanWalker",
              songCover: "assets/images/home_songs_images/Alan_Walker_2.jpg",
            ),
                      Divider(color: Colors.green,),
        
            HistoryListTile(
              songName: "The Spectre",
              songAuthor: "AlanWalker",
              songCover: "assets/images/home_songs_images/Alan_Walker_3.jpg",
            ),
                      Divider(color: Colors.green,),
        
            HistoryListTile(
              songName: "Walkverse",
              songAuthor: "AlanWalker",
              songCover: "assets/images/home_songs_images/Alan_Walker_4.jpg",
            ),
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
