import 'package:flutter/material.dart';

import '../../aspects/constants/constant_imports.dart';

class ButtonViewWrapper extends StatelessWidget {
  final Widget child;

  const ButtonViewWrapper({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.px50,
      width: Dimensions.px50,
      color: Colors.transparent,
      padding: const EdgeInsets.all(Dimensions.px4),
      child: Container(
        decoration: BoxDecoration(
          color: ColorConstants.white,
          borderRadius: BorderRadius.circular(Dimensions.px10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: child,
        ),
      ),
    );
  }
}
