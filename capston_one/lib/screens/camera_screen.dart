import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'result_screen.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  // To control the camera.
  // To initialize the camera.
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;

// A list to store the captured red color averages.
  List<double> redAverages = [];
  Timer? bpmTimer;
  String bpmText = "Calculating...";
  bool isFlashOn = false;
  bool isStreaming = false;
  bool _isCameraReady = false;
  int? lastBpmValue;
  String lastLevel = "Calculating...";

  @override
  // In initState, it calls _setupCamera to start the camera.
  void initState() {
    super.initState();
    _setupCamera();
  }

  Future<void> _setupCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        print("No cameras found");
        return;
      }
//Low resolution means images and videos have fewer pixels 
//Compared to higher resolutions like ResolutionPreset.high or max, the image quality and detail are lower.
      _controller = CameraController(
        cameras.first,
        ResolutionPreset.low,
        enableAudio: false,
      );

      _initializeControllerFuture = _controller!.initialize();
      await _initializeControllerFuture;

      if (mounted) {
        setState(() {
          _isCameraReady = true;
        });
      }
 // The heart rate measurement starts by calling startMeasurement().
      startMeasurement();
    } catch (e) {
      print("Error initializing camera: $e");
    }
  }

//Turns on the camera flash.
//Starts the camera image stream using startImageStream(processCameraImage).
  void startMeasurement() async {
    try {
      await _controller?.setFlashMode(FlashMode.torch);
      isFlashOn = true;

      if (!isStreaming && _controller!.value.isInitialized) {
        await _controller?.startImageStream(processCameraImage);
        isStreaming = true;
      }

      bpmTimer?.cancel(); 
      bpmTimer = Timer(Duration(seconds: 15), () {
        if (mounted) {
          stopMeasurement();
        }
      });

      if (mounted) {
        setState(() {
          bpmText = "Calculating...";
        });
      }
    } catch (e) {
      print("Error starting measurement: $e");
    }
  }

  void stopMeasurement() async {
    if (isStreaming && _controller!.value.isStreamingImages) {
      try {
        await _controller?.stopImageStream();
        isStreaming = false;
      } catch (e) {
        print("Error stopping stream: $e");
      }
    }

    if (isFlashOn) {
      try {
        await _controller?.setFlashMode(FlashMode.off);
        isFlashOn = false;
      } catch (e) {
        print("Error turning off flash: $e");
      }
    }

    if (mounted) {
      calculateBPM();
    }
  }

  void processCameraImage(CameraImage image) {
    try {
      final int width = image.width;
      final int height = image.height;

      final yPlane = image.planes[0].bytes;
      final vPlane = image.planes[2].bytes;

      double redSum = 0;
      int count = 0;

      for (int i = 0; i < width * height; i += 1000) {
        final y = yPlane[i];
        final v = vPlane[(i ~/ 4)];
        double r = (y + 1.370705 * (v - 128)).clamp(0, 255).toDouble();
        redSum += r;
        count++;
      }

      final averageRed = redSum / count;
      redAverages.add(averageRed);

      if (redAverages.length > 512) {
        redAverages.removeAt(0);
      }
    } catch (e) {
      print('Error processing camera image: $e');
    }
  }

 void calculateBPM() {
  if (redAverages.isEmpty) {
    if (mounted) {
      setState(() {
        bpmText = "Data not enough, try again.";
      });
    }
    return;
  }

  double average = redAverages.reduce((a, b) => a + b) / redAverages.length;
  int bpm = average.toInt();

 //* Calculates the heart rate based on the average value.
  if (bpm > 100) {
    bpm = 100;
  }
  if (mounted) {
    setState(() {
      lastBpmValue = bpm;

      if (average > 100) {
        bpmText = "Your BPM is Normal: $bpm";
        lastLevel = "Normal";
      } else if (average < 60) {
        bpmText = "Your BPM is Low: $bpm";
        lastLevel = "Low";
      } else {
        bpmText = "Your BPM is High: $bpm";
        lastLevel = "High";
      }
    });
  }
}


  @override
  void dispose() {
    bpmTimer?.cancel();

    if (isStreaming && _controller?.value.isStreamingImages == true) {
      _controller?.stopImageStream().catchError((e) {
        print("Error stopping stream in dispose: $e");
      });
      isStreaming = false;
    }

    if (isFlashOn) {
      _controller?.setFlashMode(FlashMode.off).catchError((e) {
        print("Error turning off flash in dispose: $e");
      });
      isFlashOn = false;
    }

    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isCameraReady) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 80),
          AspectRatio(
            aspectRatio: _controller!.value.aspectRatio,
            child: CameraPreview(_controller!),
          ),
          SizedBox(height: 40),
          Text(
            bpmText,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          SizedBox(
            width: 300,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                stopMeasurement();
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 117, 56, 121),
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
          SizedBox(height: 15),
          SizedBox(
            width: 300,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                stopMeasurement();
                final now = DateTime.now();
                final formattedDate =
                    "${now.year}-${now.month}-${now.day} ${now.hour}:${now.minute}";

                final Map<String, String> result = {
                  "level": lastLevel,
                  "bpm": lastBpmValue.toString(),
                  "date": formattedDate,
                };

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(bpmHistory: [result]),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Show Result',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
          SizedBox(height: 90),
        ],
      ),
    );
  }
}
