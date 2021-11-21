import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle regularText(
          {required Color color,
          required bool decoration,
          required double fontSize}) =>
      TextStyle(
        fontSize: fontSize,
        color: color,
        // fontWeight: FontWeight.w500,
        decoration:
            decoration == true ? TextDecoration.underline : TextDecoration.none,
      );

  static TextStyle semiBoldText(
          {required Color color,
          required bool decoration,
          required double fontSize}) =>
      TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w600,
        decoration:
            decoration == true ? TextDecoration.underline : TextDecoration.none,
      );

  static TextStyle boldText(
          {required Color color,
          required bool decoration,
          required double fontSize,
          required FontWeight fontWeight}) =>
      TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        decoration:
            decoration == true ? TextDecoration.underline : TextDecoration.none,
      );
}
