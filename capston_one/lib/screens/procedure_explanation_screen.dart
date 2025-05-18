import 'package:flutter/material.dart';
import 'pre_measurement_screen.dart'; // استدعاء صفحة القياس

class ExplanationScreen extends StatelessWidget {
  final String phobiaName;

  ExplanationScreen({super.key, required this.phobiaName});

  //phobiaDetails: Contains the phobia name as a Key and its image path as a Value.
  //phobiaDescriptions: Contains the phobia name as a Key and its description as a Value
  final Map<String, String> phobiaDetails = {
    "Darkness": "assets/pic/dark.jpg",
    "Heights": "assets/pic/heights.jpg",
    "Public Speaking": "assets/pic/public.jpg",
    "Insects": "assets/pic/spiders.jpg",
  };

  final Map<String, String> phobiaDescriptions = {
    "Darkness": "Fear of darkness is common, especially among children, and can cause anxiety in adults as well.",
    "Heights": "Acrophobia, or fear of heights, is an excessive fear of high places.",
    "Public Speaking": "Public speaking, is one of the most common fears in the world.",
    "Insects": " The fear of insects, which can cause discomfort or even panic."
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 70),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 59),
                child: Text(
                  phobiaName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 117, 56, 121),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 55),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  phobiaDetails[phobiaName] ?? '',
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 20),
           Padding(
  padding: const EdgeInsets.symmetric(horizontal: 60),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        phobiaDescriptions[phobiaName] ?? '',
        textAlign: TextAlign.start,
        style: const TextStyle(
          fontSize: 14,
          height: 1.5,
          color: Colors.black87,
        ),
      ),
    ],
  ),
),
            const Spacer(),
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
                              PreMeasurement(phobiaName: phobiaName),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 117, 56, 121),
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                      textStyle: const TextStyle(fontSize: 16, color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: const Size(320, 60),
                    ),
                    child: const Text(
                      'I am Ready',
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
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                      textStyle: const TextStyle(fontSize: 16, color: Colors.white),
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
