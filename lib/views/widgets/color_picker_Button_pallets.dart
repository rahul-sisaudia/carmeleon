import 'package:carmeleon/aspects/constants/color_constants.dart';
import 'package:carmeleon/aspects/dimensions/dimensions.dart';
import 'package:cyclop/cyclop.dart';
import 'package:flutter/material.dart';

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
        _buildButtonPalletsView(
          EyedropperButton(
              iconColor: ColorConstants.black,
              icon: Icons.colorize,
              onColor: (value) {
                setState(() {
                  backgroundColor = value;
                  print('########################## $backgroundColor');
                });
              }),
        ),
        GestureDetector(
          onTap: () {
            //implement color save functionality
          },
          child: _buildButtonPalletsView(
            const Icon(
              Icons.delete_outline,
              size: Dimensions.px35,
              color: Colors.black,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: _buildButtonPalletsView(
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

  _buildButtonPalletsView(Widget icon) {
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
