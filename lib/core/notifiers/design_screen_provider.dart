import 'package:carmeleon/aspects/enum/body_enum.dart';
import 'package:flutter/material.dart';

class DesignScreenProvider extends ChangeNotifier {
  CarEnum? _bodyPart;
  bool _isOptionVisible = false;
  int _selectedIndex = 0;

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

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }
}
