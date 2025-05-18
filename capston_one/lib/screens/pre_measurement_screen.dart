import 'package:flutter/material.dart';
import 'video_screen.dart';

class PreMeasurement extends StatelessWidget {
  final String phobiaName;

  const PreMeasurement({super.key, required this.phobiaName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/pic/vr5.png',
              width: 300,
              height: 450,
            ),
            const SizedBox(height: 4),
            const Text(
              'Please wear the VR glasses',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              VideoScreen(phobiaName: phobiaName),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 117, 56, 121),
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 12),
                      textStyle: const TextStyle(
                          fontSize: 16, color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: const Size(320, 60),
                    ),
                    child: const Text(
                      'Got it ',
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
                          vertical: 10, horizontal: 12),
                      textStyle: const TextStyle(
                          fontSize: 16, color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: const Size(320, 60),
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
    );
  }
}
