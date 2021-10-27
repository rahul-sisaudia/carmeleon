import 'package:carmeleon/utils/color_constants.dart';
import 'package:carmeleon/utils/device_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorPallets extends StatelessWidget {
  ColorPallets({Key key}) : super(key: key);

  final List<Color> colors = <Color>[
    ColorConstants.blue,
    ColorConstants.black,
    ColorConstants.grey,
    ColorConstants.red,
    ColorConstants.darkBlack,
    ColorConstants.dullWhite,
    ColorConstants.lightBlack,
  ];

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10,
      right: 10,
      top: DeviceSize.height(context) / 1.18,
      child: Container(
        height: DeviceSize.height(context) / 7,
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 7,
            itemBuilder: (context, i) {
              return Container(
                margin: EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  color: ColorConstants.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: DeviceSize.width(context) / 22,
                    decoration: BoxDecoration(
                      color: colors[i],
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
