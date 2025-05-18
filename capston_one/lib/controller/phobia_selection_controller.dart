import 'package:flutter/material.dart';
//local_storage.dart to call functions for saving and retrieving data (such as the username).
import '../repository/local_storage.dart';
import '../screens/procedure_explanation_screen.dart';


//This class acts as an intermediary between the UI and the data/logic (Controller).
//Returns the stored username from LocalStorage.
class PhobiaSelectionController {
  String? getUserName() {
    return LocalStorage.getUserName();
  }

  void navigateToExplanation(BuildContext context, String phobiaName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ExplanationScreen(phobiaName: phobiaName),
      ),
    );
  }
}
