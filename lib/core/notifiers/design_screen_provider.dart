import 'package:flutter/material.dart';

import '../../aspects/enum/body_enum.dart';
import '../modals/car_history_modal.dart';

class DesignScreenProvider extends ChangeNotifier {
  CarEnum? _bodyPart;
  bool _isOptionVisible = true;
  int? _currentBpSelectedIndex;
  List<CarHistoryData> historyList = <CarHistoryData>[];

  CarEnum? get bodyPart => _bodyPart;

  set bodyPart(CarEnum? value) {
    _bodyPart = value;
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
