import 'package:flutter/material.dart';

class TemplateProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _templates = [];
  List<Map<String, dynamic>> get templates => _templates;
  void addTemplate(String id, String title, String imagePath, double price) {
    _templates.add({
      'id': id,
      'title': title,
      'imagePath': imagePath,
      'price': price,
    });
    notifyListeners();
  }

  void removeTemplateById(String id) {
    _templates.removeWhere((template) => template['id'] == id);
    notifyListeners();
  }

  void clearAll() {
    _templates.clear();
    notifyListeners();
  }
}
