import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static String _name = '';
  static bool _isDarkMode = false;
  static int _gender = 1;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get name => _prefs.getString('name') ?? _name;

  static set name(String value) {
    _name = value;
    _prefs.setString('name', value);
  }

  static bool get isDarkMode => _prefs.getBool('isDarkMode') ?? _isDarkMode;

  static set isDarkMode(bool value) {
    _isDarkMode = value;
    _prefs.setBool('isDarkMode', value);
  }

  static int get gender => _prefs.getInt('gender') ?? _gender;

  static set gender(int value) {
    _gender = value;
    _prefs.setInt('gender', value);
  }
}
