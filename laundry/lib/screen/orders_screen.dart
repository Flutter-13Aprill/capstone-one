import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),

        shadowColor: Colors.black,
        elevation: 5.0,

        backgroundColor: Color.fromARGB(255, 245, 245, 220),

        toolbarHeight: 100,

        automaticallyImplyLeading: false,

        title: Center(
          child: Text(
            "Orders",
            style: TextStyle(
              fontSize: 32,
              color: const Color.fromARGB(166, 0, 0, 0),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

      body: Center(child: Text("You don't have any order yet")),
    );
  }
}
