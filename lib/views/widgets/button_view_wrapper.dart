import 'package:flutter/material.dart';

import '../../aspects/constants/constant_imports.dart';
import '../../core/helpers/helper_imports.dart';

class ButtonViewWrapper extends StatelessWidget {
  final Widget child;

  const ButtonViewWrapper({required this.child});

  @override
  Widget build(BuildContext context) {
    final _width = SizeHelper.getButtonViewWidth(context);
    print('_width: $_width');

    return Container(
      height: _width,
      width: _width,
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
