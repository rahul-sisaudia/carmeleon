import 'package:shared_preferences/shared_preferences.dart';

class PreferenceConnector {
  static SharedPreferences? _sharedPreferences;

  static Future<void> preferenceInitializer() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static String getColors(String key) {
    return _sharedPreferences!.getString(key) ?? '';
  }

  static Future setColors(String key, String value) async {
    await _sharedPreferences!.setString(key, value);

  }
}
