import 'package:carmeleon/aspects/constants/color_constants.dart';
import 'package:carmeleon/aspects/constants/device_size.dart';
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
    ColorConstants.pink,
    ColorConstants.yellow,
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
              const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 9,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColorIndex = index;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                    color: selectedColorIndex == index
                        ? colors[index]
                        : ColorConstants.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorConstants.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: DeviceSize.width(context) / 26,
                          decoration: BoxDecoration(
                            color: colors[index],
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
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
