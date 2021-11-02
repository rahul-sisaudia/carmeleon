import 'package:flutter/material.dart';

class DesignScreenProvider extends ChangeNotifier {
  bool _isRimSelected = false;
  bool _isBodySelected = false;
  bool _isOptionVisible = false;
  int _selectedIndex = 0;

  bool get isRimSelected => _isRimSelected;

  set isRimSelected(bool value) {
    _isRimSelected = value;
    notifyListeners();
  }

  bool get isBodySelected => _isBodySelected;

  set isBodySelected(bool value) {
    _isBodySelected = value;
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
