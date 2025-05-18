import 'package:flutter/material.dart';
import 'measurement_screen.dart';
//for playing video clips.
import 'package:video_player/video_player.dart';
//A slideshow with a zoom effect on the active item.
import 'package:carousel_slider/carousel_slider.dart';

class VideoScreen extends StatefulWidget {
  final String phobiaName;

  const VideoScreen({super.key, required this.phobiaName});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final Map<String, String> _videoPaths = {
    'Level 1': 'assets/videos/lv1.mp4',
    'Level 2': 'assets/videos/lv2.mp4',
    'Level 3': 'assets/videos/lv3.mp4',
    'Level 4': 'assets/videos/lv4.mp4',
  };
//_controllers: A map to link each level with its VideoPlayerController.
  final Map<String, VideoPlayerController> _controllers = {};
  bool _allInitialized = false;
  String? _selectedLevel;


// Initializes all video clips.
  @override
  void initState() {
    super.initState();
    _initializeAllVideos();
  }

  void _initializeAllVideos() async {
    for (var entry in _videoPaths.entries) {
      final controller = VideoPlayerController.asset(entry.value);
      _controllers[entry.key] = controller;
      await controller.initialize();
      setState(() {});
    }
    setState(() {
      _allInitialized = true;
      _selectedLevel = _videoPaths.keys.first;
    });
  }
// When the page is closed, the video players are disposed of to free up memory.
  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_allInitialized) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 100),
                  child: Text(
                    "Choose Level",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
//The videos are displayed in a CarouselSlider, allowing horizontal navigation between them.
//When the video is tapped, it toggles between play and pause.
              SizedBox(
                height: 250,
                child: Stack(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 250,
                        enlargeCenterPage: true,
                        autoPlay: false,
                        viewportFraction: 0.8,
                        aspectRatio: 16 / 9,
                        enableInfiniteScroll: false,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _selectedLevel = _videoPaths.keys.elementAt(index);
                          });
                        },
                      ),
                      items: _videoPaths.keys.map((quality) {
                        VideoPlayerController? controller = _controllers[quality];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (controller.value.isPlaying) {
                                controller.pause();
                              } else {
                                controller.play();
                              }
                            });
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                AspectRatio(
                                  aspectRatio: controller!.value.aspectRatio,
                                  child: VideoPlayer(controller),
                                ),
                                if (!controller.value.isPlaying)
                                  Icon(
                                    Icons.play_circle_filled,
                                    size: 64,
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    Positioned(
                      left: 36,
                      top: 5,
                      child: Text(
                        _selectedLevel ?? '',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 117, 56, 121),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    ElevatedButton(
      onPressed: _selectedLevel == null
      ? null
      : () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MeasurementScreen(
                selectedLevel: _selectedLevel!,
              ),
            ),
          );
        },
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 117, 56, 121),
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 130),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  child: const Text(
    'Next',
    style: TextStyle(color: Colors.white),
  ),
),

                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 145, 142, 146),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 130),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Back',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


