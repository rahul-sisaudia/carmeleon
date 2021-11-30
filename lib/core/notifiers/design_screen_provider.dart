import 'package:flutter/material.dart';

import '../../aspects/constants/color_list.dart';
import '../modals/car_history_modal.dart';

class DesignScreenProvider extends ChangeNotifier {
  bool _isDoneBtnClicked = false;
  int? _currentBpSelectedIndex;
  int? _tempColorListLength;
  List<CarHistoryData> historyList = <CarHistoryData>[];
  final List<Color> _temColorList = List.from(ColorList.colorsList);

  bool get isDoneBtnClicked => _isDoneBtnClicked;

  set isDoneBtnClicked(bool value) {
    _isDoneBtnClicked = value;
    notifyListeners();
  }

  dynamic get temColorList => _temColorList;

  set temColorList(dynamic value) {
    _temColorList.add(value);
    notifyListeners();
  }

  int? get selectedIndex => _currentBpSelectedIndex;

  set selectedIndex(int? value) {
    _currentBpSelectedIndex = value;
    notifyListeners();
  }

  int? get tempColorListLength => _tempColorListLength;

  set tempColorListLength(int? value) {
    _tempColorListLength = _temColorList.length;
    notifyListeners();
  }
}
