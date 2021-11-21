import 'package:carmeleon/core/modals/car_history_modal.dart';
import 'package:carmeleon/core/notifiers/design_screen_provider.dart';
import 'package:carmeleon/views/screens/camera_screen.dart';
import 'package:flutter/material.dart';

import 'package:carmeleon/aspects/constants/color_constants.dart';
import 'package:carmeleon/core/helper/device_size_helper.dart';
import 'package:carmeleon/aspects/constants/dimension_constants.dart';
import 'package:carmeleon/aspects/constants/color_list.dart';

class ColorPallets extends StatefulWidget {
  final bool isShowAddColorBtn;
  final bool isColorPicker;
  final bool isDoneBtnClicked;
  final DesignScreenProvider designScreenProvider;

  ColorPallets(
      {required this.designScreenProvider,
      this.isShowAddColorBtn = false,
      this.isColorPicker = false,
      this.isDoneBtnClicked = false});

  @override
  State<ColorPallets> createState() => _ColorPalletsState();
}

class _ColorPalletsState extends State<ColorPallets> {
  void onColorBtnTap(int index) {
    widget.designScreenProvider.selectedIndex = index;
    setState(() {});
    if (!widget.designScreenProvider.isDoneBtnClicked) {
      final _hist = CarHistoryData(
          colorCode: ColorList.colors[index].toString(),
          bodyPart: widget.designScreenProvider.bodyPart);
      widget.designScreenProvider.historyList.add(_hist);
      //<<<<<<<<<<<<<<<<<<<<<<<< print List Data>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

      for (int i = 0; i < widget.designScreenProvider.historyList.length; i++) {
        print('${widget.designScreenProvider.historyList[i].bodyPart} => ' +
            '${widget.designScreenProvider.historyList[i].colorCode}');
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10,
      right: 10,
      top: DeviceSizeHelper.height(context) / 1.18,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: DeviceSizeHelper.height(context) / Dimensions.px9,
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(Dimensions.px10),
              ),
              child: const Icon(
                Icons.chevron_left,
                size: Dimensions.px25,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: DeviceSizeHelper.height(context) / Dimensions.px7,
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(Dimensions.px20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 5, bottom: 5),
                child: Row(
                  children: [
                    widget.isColorPicker
                        ? Container()
                        : GestureDetector(
                            onTap: () async {
                              final _route = MaterialPageRoute(
                                builder: (context) =>
                                    CameraScreen(isForColorPicker: true),
                              );
                              await Navigator.of(context).push(_route);
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 8),
                              decoration: BoxDecoration(
                                color: ColorConstants.white,
                                borderRadius:
                                    BorderRadius.circular(Dimensions.px20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  //width: DeviceSize.width(context) / Dimensions.px26,
                                  child: const Icon(
                                    Icons.add,
                                    size: Dimensions.px42,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.isColorPicker
                            ? widget.designScreenProvider.temColorList.length
                            : ColorList.colors.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => onColorBtnTap(index),
                            child: Container(
                              margin: EdgeInsets.only(left: 8),
                              decoration: BoxDecoration(
                                color: ((widget.designScreenProvider
                                                .selectedIndex !=
                                            null) &&
                                        (widget.designScreenProvider
                                                .selectedIndex ==
                                            index))
                                    ? widget.isColorPicker
                                        ? widget.designScreenProvider
                                            .temColorList[index]
                                        : ColorList.colors[index]
                                    : ColorConstants.white,
                                borderRadius:
                                    BorderRadius.circular(Dimensions.px20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ColorConstants.white,
                                    borderRadius:
                                        BorderRadius.circular(Dimensions.px20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      width: DeviceSizeHelper.width(context) /
                                          Dimensions.px26,
                                      decoration: BoxDecoration(
                                        color: widget.isColorPicker
                                            ? widget.designScreenProvider
                                                .temColorList[index]
                                            : ColorList.colors[index],
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.px40),
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
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: DeviceSizeHelper.height(context) / Dimensions.px9,
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(Dimensions.px10),
              ),
              child: const Icon(
                Icons.chevron_right,
                size: Dimensions.px25,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
