import 'package:flutter/material.dart';

class Intro2Screen extends StatelessWidget {
  const Intro2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // shadowColor: Colors.black,
        // elevation: 5.0,
        // backgroundColor: Color.fromARGB(255, 245, 245, 220),
        toolbarHeight: 100,
      ),

      body: Column(
        children: [
          SizedBox(height: 50),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              "\nChoose the service\n         you need",
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
              "We connect you with nearby\n         laundry providers",
              style: TextStyle(fontSize: 24, color: Colors.grey[700]),
            ),
          ),

          Image.asset(
            "assets/images/laundry_store.png",
            height: 200,
            width: 200,
          ),
        ],
      ),
    );
  }
}
