import 'package:flutter/material.dart';
import 'camera_screen.dart';


class MeasurementScreen extends StatefulWidget {
  final String selectedLevel;

  const MeasurementScreen({super.key, required this.selectedLevel});

  @override
  State<MeasurementScreen> createState() => _MeasurementScreenState();
}
//TickerProviderStateMixin: Used to repeatedly update the animation.
class _MeasurementScreenState extends State<MeasurementScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _animation = Tween<double>(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // The animation loops continuously forward and backward reverse: true
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ScaleTransition(
              scale: _animation,
              child: Icon(
                Icons.favorite,
                color: const Color.fromARGB(255, 185, 42, 32),
                size: 45,
              ),
            ),

            const SizedBox(height: 30),

            Container(
              width: 390,
              height: 350,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 188, 185, 188),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Put your finger on the camera to measure your heart rate",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),

                  Image.asset(
                    'assets/pic/hand.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),
            SizedBox(
              width: 300,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  CameraScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 117, 56, 121),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Got it',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),

            const SizedBox(height: 15),
            SizedBox(
              width: 300,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Back',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
