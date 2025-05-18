import 'package:coffee/screens/login_screen.dart';
import 'package:coffee/widget/custom_botton.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> pages = [
    {
      'image': 'assets/images/splash.png',
      'title': 'With COFFEENO',
      'desc': 'Get the best coffee'
    },
    {
      'image': 'assets/images/splash.png',
      'title': 'With COFFEENO',
      'desc': 'Many options at your fingertips'
    },
    {
      'image': 'assets/images/splash.png',
      'title': 'With COFFEENO',
      'desc': 'Order it from your place! It will be delivered to your home as soon as possible.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: pages.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (context, index) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  // Fullscreen background image
                  Image.asset(
                    pages[index]['image']!,
                    fit: BoxFit.cover,
                  ),
                  Container(color: const Color.fromARGB(93, 0, 0, 0)),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pages[index]['title']!,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          pages[index]['desc']!,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
          // Dots indicator
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(pages.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.white : Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
          ),
          if (_currentPage == pages.length - 1)
            Positioned(
              bottom: 40,
              left: 40,
              right: 40,
              child: CustomBotton(lable: 'Get Sterted', screen: LoginScreen(), width: 0.8)
            ),
        ],
      ),
    );
  }
}
