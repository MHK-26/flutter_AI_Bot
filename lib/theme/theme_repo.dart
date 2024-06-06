import 'package:shared_preferences/shared_preferences.dart';

class ThemeRepository {
  static const String _key = 'isDarkMode';

  Future<void> setDarkMode(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, isDarkMode);
  }

  Future<bool> isDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? false;
  }
}
