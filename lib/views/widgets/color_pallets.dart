import 'package:carmeleon/aspects/constants/color_constants.dart';
import 'package:carmeleon/aspects/constants/device_size.dart';
import 'package:carmeleon/aspects/dimensions/dimensions.dart';
import 'package:carmeleon/core/history_list/color_list.dart';
import 'package:carmeleon/core/history_list/history_list.dart';
import 'package:carmeleon/core/modals/car_history_modal.dart';
import 'package:carmeleon/core/notifiers/design_screen_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorPallets extends StatefulWidget {
  final DesignScreenProvider designScreenProvider;
  ColorPallets({Key? key, required this.designScreenProvider})
      : super(key: key);

  @override
  State<ColorPallets> createState() => _ColorPalletsState();
}

class _ColorPalletsState extends State<ColorPallets> {
  void onColorBtnTap(int index) {
    widget.designScreenProvider.selectedIndex = index;
    HistoryList.historyList.add(CarHistoryData(
        colorCode: ColorList.colors[widget.designScreenProvider.selectedIndex]
            .toString(),
        bodyPart: widget.designScreenProvider.bodyPart));

    //<<<<<<<<<<<<<<<<<<<<<<<< print List Data>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    for (int i = 0; i < HistoryList.historyList.length; i++) {
      print('${HistoryList.historyList[i].bodyPart} => ' +
          '${HistoryList.historyList[i].colorCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10,
      right: 10,
      top: DeviceSize.height(context) / 1.18,
      child: Container(
        height: DeviceSize.height(context) / Dimensions.px7,
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(Dimensions.px20),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 9,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => onColorBtnTap(index),
                child: Container(
                  margin: EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                    color: widget.designScreenProvider.selectedIndex == index
                        ? ColorList.colors[index]
                        : ColorConstants.white,
                    borderRadius: BorderRadius.circular(Dimensions.px20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorConstants.white,
                        borderRadius: BorderRadius.circular(Dimensions.px20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: DeviceSize.width(context) / Dimensions.px26,
                          decoration: BoxDecoration(
                            color: ColorList.colors[index],
                            borderRadius:
                                BorderRadius.circular(Dimensions.px40),
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
