import 'package:flutter/material.dart';

import '../../core/extensions/hex_color.dart';
import '../../core/helpers/helper_imports.dart';
import 'constant_imports.dart';

class ColorList {
  static List<Color> colorsList = <Color>[];

  static List<String> hexColorCodeList = <String>[
    'FF0B0B09',
    'FF7444F4',
    'FF0F0F0F',
    'FFF2F6F9',
    'FF394652'
  ];

  /// this method is used for initialize shared preferences
  /// check the data exist or not in shared preference then
  /// get color from shared preference stringList
  static Future checkAndAddDefaultColors() async {
    final _sharedPrefHelper = SharedPrefHelper();

    final _isColorsListExist =
        await _sharedPrefHelper.containsKey(SharedPrefsConstants.colorList);
    if (_isColorsListExist) {
      var _hexColorCodesList = await _sharedPrefHelper.getHexColorCodesList();
      ColorList.colorsList.clear();
      for (var i = 0; i < _hexColorCodesList.length; i++) {
        ColorList.colorsList.add(HexColor(_hexColorCodesList[i]));
      }
    } else {
      for (var i = 0; i < ColorList.hexColorCodeList.length; i++) {
        var valueString = ColorList.hexColorCodeList[i];
        ColorList.colorsList.add(HexColor(valueString));
      }
    }
  }
}
