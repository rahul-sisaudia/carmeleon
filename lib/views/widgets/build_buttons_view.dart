import 'package:flutter/material.dart';

import '../../aspects/constants/contant_imports.dart';

class BuildButtonsView extends StatelessWidget {
  final Widget icon;

  const BuildButtonsView({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.px5),
      child: Container(
        decoration: BoxDecoration(
          color: ColorConstants.white,
          borderRadius: BorderRadius.circular(Dimensions.px10),
        ),
        child: Padding(padding: const EdgeInsets.all(2), child: icon),
      ),
    );
  }
}
