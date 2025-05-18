import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _favorites = [];

  List<Map<String, dynamic>> get favorites => _favorites;

  void toggleFavorite(Map<String, dynamic> item) {
    if (isFavorite(item)) {
      _favorites.removeWhere((element) => element['title'] == item['title']);
    } else {
      _favorites.add(item);
    }
    notifyListeners();
  }
  bool isFavorite(Map<String, dynamic> item) {
    return _favorites.any((element) => element['title'] == item['title']);
  }
}
