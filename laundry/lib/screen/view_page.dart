import 'package:flutter/material.dart';
import 'package:laundry/screen/intro1_screen.dart';
import 'package:laundry/screen/intro2_screen.dart';
import 'package:laundry/screen/intro3_screen.dart';
import 'package:laundry/screen/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ViewPage extends StatelessWidget {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //page view
          SizedBox(
            height: 700,
            child: PageView(
              controller: _controller,

              children: const [Intro1Screen(), Intro2Screen(), Intro3Screen()],
            ),
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: ExpandingDotsEffect(
              dotColor: Color.fromARGB(255, 200, 200, 200),
              activeDotColor: Color.fromARGB(255, 131, 141, 95),

              dotHeight: 8,
              dotWidth: 15,
            ),
          ),
          SizedBox(height: 40),

          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },

            child: Text(
              "Skip",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Color.fromARGB(255, 200, 200, 200),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
