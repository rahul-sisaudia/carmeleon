import 'package:flutter/material.dart';

import 'package:carmeleon/aspects/enum/body_enum.dart';
import 'package:carmeleon/core/modals/car_history_modal.dart';

class DesignScreenProvider extends ChangeNotifier {
  CarEnum? _bodyPart;
  bool _isDoneBtnClicked = false;
  bool _isOptionVisible = true;
  int? _currentBpSelectedIndex;
  List<CarHistoryData> historyList = <CarHistoryData>[];

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

  int? get selectedIndex => _currentBpSelectedIndex;

  set selectedIndex(int? value) {
    _currentBpSelectedIndex = value;
    notifyListeners();
  }
}
