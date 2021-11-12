import 'package:carmeleon/aspects/constants/color_constants.dart';
import 'package:carmeleon/aspects/dimensions/dimensions.dart';
import 'package:cyclop/cyclop.dart';
import 'package:flutter/material.dart';

import 'build_buttons_view.dart';

class ColorPickerButtonPallets extends StatefulWidget {
  @override
  _ColorPickerButtonPalletsState createState() =>
      _ColorPickerButtonPalletsState();
}

class _ColorPickerButtonPalletsState extends State<ColorPickerButtonPallets> {
  Color backgroundColor = ColorConstants.yellow;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BuildButtonsView().buildButtonPalletsView(
          EyedropperButton(
            iconColor: ColorConstants.black,
            icon: Icons.colorize,
            onColor: (value) {
              setState(
                () {
                  backgroundColor = value;
                  print('########################## ColorCode: $backgroundColor');
                },
              );
            },
          ),
        ),
        GestureDetector(
          onTap: () {
            //implement color save functionality
          },
          child: BuildButtonsView().buildButtonPalletsView(
            const Icon(
              Icons.delete_outline,
              size: Dimensions.px35,
              color: Colors.black,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: BuildButtonsView().buildButtonPalletsView(
            const Icon(
              Icons.done_rounded,
              size: Dimensions.px35,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
