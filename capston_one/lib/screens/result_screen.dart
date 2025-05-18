import 'package:flutter/material.dart';
import 'start_screen.dart';
import 'camera_screen.dart';

class ResultScreen extends StatefulWidget {
  final List<Map<String, String>> bpmHistory;

  const ResultScreen({Key? key, required this.bpmHistory}) : super(key: key);

  @override
  _ResultScreen createState() => _ResultScreen();
}

class _ResultScreen extends State<ResultScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//A list of previous measurements, level: The phobia level. bpm: The heart rate. date: The date of the measurement.
  List<Map<String, String>> latestMeasurements = [];

  @override
  void initState() {
    super.initState();
    _updateLatestMeasurements();
  }
//_updateLatestMeasurements is called to refresh the list of recent measurements.
  void _updateLatestMeasurements() {
    if (widget.bpmHistory.length > 3) {
      latestMeasurements = widget.bpmHistory.reversed.take(3).toList();
    } else {
      latestMeasurements = widget.bpmHistory.reversed.toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      //Home: Navigates back to the main page (StartScreen).
      //Measurement: Navigates to the measurement page (CameraScreen).
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 117, 56, 121),
              ),
              child: const Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const StartScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Measurement'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => CameraScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: const Icon(Icons.menu, size: 28),
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
          ),
          Expanded(
            child: latestMeasurements.isEmpty
                ? const Center(child: Text("No measurements found"))
                : ListView.builder(
                    itemCount: latestMeasurements.length,
                    itemBuilder: (context, index) {
                      final measurement = latestMeasurements[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: ListTile(
                          title: Text("Level: ${measurement['level']}"),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("BPM: ${measurement['bpm']}"),
                              Text("Date: ${measurement['date']}"),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
