import 'package:carmeleon/constants/color_constants.dart';
import 'package:carmeleon/constants/device_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorPallets extends StatefulWidget {
  ColorPallets({Key? key}) : super(key: key);

  @override
  State<ColorPallets> createState() => _ColorPalletsState();
}

class _ColorPalletsState extends State<ColorPallets> {
  int selectedColorIndex = 0;
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
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColorIndex = index;
                    print(selectedColorIndex);
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    color: selectedColorIndex == index
                        ? ColorConstants.red
                        : ColorConstants.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: DeviceSize.width(context) / 22,
                      decoration: BoxDecoration(
                        color: colors[index],
                        borderRadius: BorderRadius.circular(40),
                      ),
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
