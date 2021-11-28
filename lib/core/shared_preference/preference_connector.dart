import 'package:shared_preferences/shared_preferences.dart';

class PreferenceConnector {
  static SharedPreferences? _sharedPreferences;

  static Future<void> preferenceInitializer() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<List<String>?> getColor() async {
    var data = _sharedPreferences!.getStringList('colorData');
    return data;
  }

  static Future setColors(List<String> value) async {
    await _sharedPreferences!.setStringList('colorData', value);
  }
}
