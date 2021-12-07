import 'package:flutter/widgets.dart';

class SizeHelper {
  static double getDeviceHeight(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return height;
  }

  static double getDeviceWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width;
  }

  static double getButtonViewWidth(BuildContext context) {
    final _width = MediaQuery.of(context).size.width / 17;
    return _width;
  }
}
