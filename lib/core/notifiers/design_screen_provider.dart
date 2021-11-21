import 'package:flutter/material.dart';

import '../../aspects/constants/color_list.dart';
import '../../aspects/enum/body_enum.dart';
import '../modals/car_history_modal.dart';

class DesignScreenProvider extends ChangeNotifier {
  CarEnum? _bodyPart;
  bool _isDoneBtnClicked = false;
  bool _isOptionVisible = true;
  int? _currentBpSelectedIndex;
  int? _tempColorListLength;
  List<CarHistoryData> historyList = <CarHistoryData>[];
  final List<Color> _temColorList = List.from(ColorList.colors);

  CarEnum? get bodyPart => _bodyPart;

  set bodyPart(CarEnum? value) {
    _bodyPart = value;
    notifyListeners();
  }

  bool get isDoneBtnClicked => _isDoneBtnClicked;

  set isDoneBtnClicked(bool value) {
    _isDoneBtnClicked = value;
    notifyListeners();
  }

  bool get isOptionVisible => _isOptionVisible;

  set isOptionVisible(bool value) {
    _isOptionVisible = value;
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
