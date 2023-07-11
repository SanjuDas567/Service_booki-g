import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesProvider {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future saveData(String key, String value) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString(key, value);
  }

  Future<String?> getData(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key);
  }

  Future saveToken(String token) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('token', token);
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('token');
  }
}

