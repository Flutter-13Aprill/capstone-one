import 'dart:async';
import 'package:flutter/material.dart';
import 'start_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<Offset> points = [];
  double x = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 13), (_) {
      setState(() {
        x += 4;
        double y = getHeartbeatY(x);
        points.add(Offset(x, y));


        if (x > MediaQuery.of(context).size.width) {
          x = 0;
          points.clear();
        }
      });
    });

    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const StartScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  double getHeartbeatY(double x) {
   //getHeartbeatY: Responsible for determining the height of the wave.
    double period = 100;
    double localX = x % period;

    if (localX < 15) return 90;   
    if (localX < 20) return 70;    
    if (localX < 25) return 90;    
    if (localX < 30) return 50;     
    if (localX < 50) return 100;    
    if (localX < 70) return 95;    
    return 100;                     
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/pic/hand.png',
              width: MediaQuery.of(context).size.width,
              height: 390,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'PHOBIA MONITOR',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 450,
                child: CustomPaint(
                  painter: HeartbeatPainter(points),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HeartbeatPainter extends CustomPainter {
  final List<Offset> points;

  HeartbeatPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();

    if (points.length >= 4) {
      path.moveTo(points[0].dx, points[0].dy);
      for (int i = 1; i < points.length - 2; i += 2) {
        //cubicTo:This curve requires two control points and one end point.
        var p1 = points[i];
        var p2 = points[i + 1];
        var controlPoint1 = Offset((points[i - 1].dx + p1.dx) / 2, (points[i - 1].dy + p1.dy) / 2);
        var controlPoint2 = Offset((p1.dx + p2.dx) / 2, (p1.dy + p2.dy) / 2);

        path.cubicTo(
          controlPoint1.dx,
          controlPoint1.dy,
          controlPoint2.dx,
          controlPoint2.dy,
          p2.dx,
          p2.dy,
        );
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
