import 'package:flutter/material.dart';

class MealController {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final portionsController = TextEditingController();
  final priceController = TextEditingController();
  final timeController = TextEditingController();
  final locationController = TextEditingController();

  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    portionsController.dispose();
    priceController.dispose();
    timeController.dispose();
    locationController.dispose();
  }
}
