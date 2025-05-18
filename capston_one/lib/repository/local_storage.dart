// Allows storing small data (such as settings or usernames).
import 'package:shared_preferences/shared_preferences.dart';


//SharedPreferences is the object that manages storage operations
class LocalStorage {
  static SharedPreferences? _preferences;
//userNameKey is the key used to store and retrieve the username.
  static const String _userNameKey = 'userName';

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveUserName(String name) async {
    await _preferences?.setString(_userNameKey, name);
  }

  static String? getUserName() {
    return _preferences?.getString(_userNameKey);
  }

  static Future<void> clearUserName() async {
    await _preferences?.remove(_userNameKey);
  }
}
