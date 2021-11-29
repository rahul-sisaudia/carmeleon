import 'package:shared_preferences/shared_preferences.dart';

import '../../aspects/constants/constant_imports.dart';

class SharedPrefHelper {
  Future<SharedPreferences> _getSharedPref() async {
    return await SharedPreferences.getInstance();
  }

  Future<List<String>> getHexColorCodesList() async {
    var _prefs = await _getSharedPref();
    var _stringList =
        await _prefs.getStringList(SharedPrefsConstants.colorList);
    return _stringList ?? [];
  }

  Future setColorStringList(List<String> value) async {
    var _prefs = await _getSharedPref();
    await _prefs.setStringList(SharedPrefsConstants.colorList, value);
  }

  Future<bool> containsKey(String key) async {
    var _prefs = await _getSharedPref();
    return _prefs.containsKey(key);
  }

  Future clear() async {
    var _prefs = await _getSharedPref();
    await _prefs.clear();
  }

  Future<bool> getBool(String key) async {
    var _prefs = await _getSharedPref();
    return _prefs.getBool(key) ?? false;
  }

  Future<double> getDouble(String key) async {
    var _prefs = await _getSharedPref();
    return _prefs.getDouble(key) ?? -1;
  }

  Future<int> getInt(String key) async {
    var _prefs = await _getSharedPref();
    return _prefs.getInt(key) ?? -1;
  }

  Future<String> getString(String key) async {
    var _prefs = await _getSharedPref();
    return _prefs.getString(key) ?? '';
  }

  void setBool(String key, bool value) async {
    var _prefs = await _getSharedPref();
    _prefs.setBool(key, value);
  }

  void setDouble(String key, double value) async {
    var _prefs = await _getSharedPref();
    _prefs.setDouble(key, value);
  }

  Future setInt(String key, int value) async {
    var _prefs = await _getSharedPref();
    _prefs.setInt(key, value);
  }

  Future setString(String key, String value) async {
    var _prefs = await _getSharedPref();
    await _prefs.setString(key, value);
  }

  Future removeKey(String key) async {
    var _prefs = await _getSharedPref();
    _prefs.remove(key);
  }
}
