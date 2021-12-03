import 'dart:ui';

import 'package:flutter/material.dart';

import '../../aspects/constants/constant_imports.dart';
import 'button_view_wrapper.dart';

class IconButtonView extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  const IconButtonView({
    required this.icon,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ButtonViewWrapper(
        child: Icon(
          icon,
          color: color,
          size: Dimensions.px30,
        ),
      ),
    );
  }
}
