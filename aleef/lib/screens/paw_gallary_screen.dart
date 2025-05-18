import 'dart:io';
import 'package:aleef/controller/paw_gallary_controller.dart';
import 'package:flutter/material.dart';

class PawGallaryScreen extends StatefulWidget {
  /// PawGallaryScreen displays a grid gallery of pet images.
  const PawGallaryScreen({super.key});

  @override
  State<PawGallaryScreen> createState() => _PawGallaryScreenState();
}

class _PawGallaryScreenState extends State<PawGallaryScreen> {
  // List to hold locally picked images
  List<File> imagePick = [];
  // Controller that handles image fetching and loading state
  PawGallaryController pawGallaryController = PawGallaryController();

  @override
  void initState() {
    super.initState();
    // Load images from controller on init
    loadImages();
  }

  // Asynchronously fetch images and update UI
  Future<void> loadImages() async {
    await pawGallaryController.getImage();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child:
                  // Show loading spinner while images are loading
                  pawGallaryController.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          // Total number of images = remote URLs + local picked images
                          itemCount:
                              pawGallaryController.imageURl.length +
                              imagePick.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                                childAspectRatio: 0.8,
                              ),
                          itemBuilder: (context, index) {
                            // Show remote images first
                            if (index < pawGallaryController.imageURl.length) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  pawGallaryController.imageURl[index],
                                  fit: BoxFit.cover,
                                ),
                              );
                            } else {
                              // Show locally picked images after remote images
                              final localIndex =
                                  index - pawGallaryController.imageURl.length;
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.file(
                                  imagePick[localIndex],
                                  fit: BoxFit.cover,
                                ),
                              );
                            }
                          },
                        ),
                      ),
            ),
          ],
        ),
      ),
      // Button to pick new images locally and add to the gallery
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await pawGallaryController.getImageLocale(imagePick);
          setState(() {});
        },
        child: Icon(Icons.add, size: 40),
      ),
    );
  }
}
