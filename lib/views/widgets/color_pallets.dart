import 'package:carmeleon/views/screens/camera_screen.dart';
import 'package:flutter/material.dart';

import '../../aspects/constants/contant_imports.dart';
import '../../core/helpers/helper_imports.dart';
import '../../core/modals/car_history_modal.dart';
import '../../core/notifiers/design_screen_provider.dart';

class ColorPallets extends StatefulWidget {
  final bool isShowAddColorBtn;
  final bool isColorPicker;
  final bool isDoneBtnClicked;
  final DesignScreenProvider designScreenProvider;
  final VoidCallback? onAddColorBtn;


  ColorPallets({
    required this.designScreenProvider,
    this.isShowAddColorBtn = false,
    this.isColorPicker = false,
    this.isDoneBtnClicked = false,
    this.onAddColorBtn,
  });

  @override
  State<ColorPallets> createState() => _ColorPalletsState();
}

class _ColorPalletsState extends State<ColorPallets> {
  /// this function takes  integer index value
  /// tap on any color then the index value of that color will be sett as
  /// selected index
  /// and add the store thr selection of car parts with color in history list
  void _onColorBtnTap(int index) {
    widget.designScreenProvider.selectedIndex = index;
    setState(() {});
    if (!widget.designScreenProvider.isDoneBtnClicked) {
      final _hist = CarHistoryData(
          colorCode: ColorList.colors[index].toString(),
          bodyPart: widget.designScreenProvider.bodyPart);
      widget.designScreenProvider.historyList.add(_hist);
      //<<<<<<<<<<<<<<<<<<<<<<<< print List Data>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

      for (var i = 0; i < widget.designScreenProvider.historyList.length; i++) {
        print('${widget.designScreenProvider.historyList[i].bodyPart} => '
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
                            onTap: widget.onAddColorBtn,
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
                            onTap: () => _onColorBtnTap(index),
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
