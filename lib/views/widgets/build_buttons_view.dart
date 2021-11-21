import 'package:carmeleon/aspects/constants/color_constants.dart';
import 'package:carmeleon/aspects/constants/dimension_constants.dart';
import 'package:flutter/material.dart';

class BuildButtonsView {
  buildButtonPalletsView(Widget icon) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.px5),
      child: Container(
        decoration: BoxDecoration(
          color: ColorConstants.white,
          borderRadius: BorderRadius.circular(Dimensions.px10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: icon,
        ),
      ),
    );
  }
}
