import '../repository/local_storage.dart';

class StartController {
  // It checks the input based on specific conditions.
  String? validateName(String name) {
    if (name.isEmpty) {
      return 'Please enter your name!';
    } else if (name.length < 2) {
      return 'Too Short! Name must be at least 2 characters.';
    } else if (name.length > 10) {
      return 'Too Long! Name must be less than 10 characters.';
    }
    return null;
  }

  //To save the name in local storage.
  Future<void> saveName(String name) async {
    await LocalStorage.saveUserName(name);
  }
}
