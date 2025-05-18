import 'package:flutter/material.dart';

class StartedScreenController extends ChangeNotifier {
  final PageController _pageController = PageController(); // Controller for page transitions
  int _currentPage = 0; // Tracks current page index

  int get currentPage => _currentPage; // Get current page index
  PageController get pageController => _pageController; // Get page controller

  // Move to next page
  void nextPage() {
    if (_currentPage < 2) { // Check if not on last page
      _pageController.nextPage(
        duration: Duration(milliseconds: 300), // Transition duration
        curve: Curves.easeInOut, // Transition curve
      );
    }
  }

  // Trigger login page change
  void goToLogin() {
    notifyListeners(); // Notify listeners of change
  }

  // Update page index
  void updatePage(int index) {
    _currentPage = index;
    notifyListeners(); // Notify listeners of page change
  }
}
