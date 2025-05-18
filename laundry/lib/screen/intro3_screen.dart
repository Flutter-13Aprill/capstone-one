import 'package:flutter/material.dart';

class Intro3Screen extends StatelessWidget {
  const Intro3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // shadowColor: Colors.black,
        // elevation: 5.0,
        // backgroundColor: Color.fromARGB(255, 245, 245, 220),

        // toolbarHeight: 100,
      ),

      body: Column(
        children: [
          SizedBox(height: 50),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              "\nFast. Easy. Reliable.",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 31, 31, 31),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              "Schedule pickups and deliveries\n           at your convenience\n",
              style: TextStyle(fontSize: 24, color: Colors.grey[700]),
            ),
          ),

          Image.asset("assets/images/car.png", height: 200, width: 200),
        ],
      ),
    );
  }
}
