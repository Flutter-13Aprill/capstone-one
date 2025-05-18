import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:spotify_redesign/screens/settings_screen.dart';
import 'package:spotify_redesign/widgets/collections/navigation_bar_destinations.dart';
import 'package:spotify_redesign/widgets/home_widgets/category_tabs.dart';
import 'package:spotify_redesign/widgets/home_widgets/song_container.dart';
import 'package:spotify_redesign/widgets/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  bool isLoading = false;
  int selectedTabIndex = 0;
  int buttomNavigationIndex = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
    _tabController = TabController(length: 4, vsync: this);
  }

  Future loadData() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.search, color: Colors.white),
        ),

        centerTitle: true,
        title: Image.asset(
          "assets/icons/Spotify_Logo_RGB_Green.png",
          scale: 1.5,
        ),

        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
            icon: Icon(Icons.settings, color: Colors.white),
          ),
        ],
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
          children: [
            SizedBox(height: 24),
            TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorColor: Colors.lightGreen,
              dividerHeight: 0,
              tabAlignment: TabAlignment.start,
              onTap: (value) {
                setState(() {
                  selectedTabIndex = value;
                });
              },
              tabs: [
                CategoryTabs(
                  categoryIndex: 0,
                  categoryName: "Different World",
                  selectedTabIndex: selectedTabIndex,
                ),
                CategoryTabs(
                  categoryIndex: 1,
                  categoryName: "World of Walkers",
                  selectedTabIndex: selectedTabIndex,
                ),
                CategoryTabs(
                  categoryIndex: 2,
                  categoryName: "Walkerverse",
                  selectedTabIndex: selectedTabIndex,
                ),
                CategoryTabs(
                  categoryIndex: 3,
                  categoryName: "Singles",
                  selectedTabIndex: selectedTabIndex,
                ),
              ],
            ),
            SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Today's hits".tr(),
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            SizedBox(height: 16),
            Wrap(
              runSpacing: 24,
              children: [
                isLoading == true
                    ? ShimeerBox()
                    : SongContainer(
                      songName: "World of Walkers",
                      songAuthor: "Alan Walker",
                      songCover:
                          "assets/images/home_songs_images/Alan_Walker_1.jpg",
                    ),
                isLoading == true
                    ? ShimeerBox()
                    : SongContainer(
                      songName: "DarkSide",
                      songAuthor: "Alan Walker",
                      songCover:
                          "assets/images/home_songs_images/Alan_Walker_2.jpg",
                    ),
                isLoading == true
                    ? ShimeerBox()
                    : SongContainer(
                      songName: "The Spectre",
                      songAuthor: "Alan Walker",
                      songCover:
                          "assets/images/home_songs_images/Alan_Walker_3.jpg",
                    ),
                isLoading == true
                    ? ShimeerBox()
                    : SongContainer(
                      songName: "Walkerverse",
                      songAuthor: "Alan Walker",
                      songCover:
                          "assets/images/home_songs_images/Alan_Walker_4.jpg",
                    ),
                isLoading == true
                    ? ShimeerBox()
                    : SongContainer(
                      songName: "World of Walkers",
                      songAuthor: "Alan Walker",
                      songCover:
                          "assets/images/home_songs_images/Alan_Walker_1.jpg",
                    ),
                isLoading == true
                    ? ShimeerBox()
                    : SongContainer(
                      songName: "DarkSide",
                      songAuthor: "Alan Walker",
                      songCover:
                          "assets/images/home_songs_images/Alan_Walker_2.jpg",
                    ),
                isLoading == true
                    ? ShimeerBox()
                    : SongContainer(
                      songName: "The Spectre",
                      songAuthor: "Alan Walker",
                      songCover:
                          "assets/images/home_songs_images/Alan_Walker_3.jpg",
                    ),
                isLoading == true
                    ? ShimeerBox()
                    : SongContainer(
                      songName: "Walkerverse",
                      songAuthor: "Alan Walker",
                      songCover:
                          "assets/images/home_songs_images/Alan_Walker_4.jpg",
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
