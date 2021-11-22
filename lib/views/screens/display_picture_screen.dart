import 'dart:io';

import 'package:cyclop/cyclop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../aspects/constants/color_constants.dart';
import '../../aspects/constants/color_list.dart';
import '../../aspects/constants/dimension_constants.dart';
import '../../aspects/enum/body_enum.dart';
import '../../core/helpers/device_size_helper.dart';
import '../../core/modals/car_history_modal.dart';
import '../../core/notifiers/design_screen_provider.dart';
import '../widgets/image_button_pallets.dart';
import 'camera_screen.dart';

class DisplayPictureScreen extends StatefulWidget {
  final bool isColorPicker;
  final String imagePath;

  DisplayPictureScreen({
    required this.imagePath,
    required this.isColorPicker,
  });

  @override
  State<DisplayPictureScreen> createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  late DesignScreenProvider _designScreenProvider;

  void onColorBtnTap(int index) {
    _designScreenProvider.selectedIndex = index;
    setState(() {});
    if (!_designScreenProvider.isDoneBtnClicked) {
      final _hist = CarHistoryData(
          colorCode: ColorList.colors[index].toString(),
          bodyPart: _designScreenProvider.bodyPart);
      _designScreenProvider.historyList.add(_hist);
      //<<<<<<<<<<<<<<<<<<<<<<<< print List Data>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

      for (var i = 0; i < _designScreenProvider.historyList.length; i++) {
        print('${_designScreenProvider.historyList[i].bodyPart} => '
            '${_designScreenProvider.historyList[i].colorCode}');
      }
    }
  }

  _onAddColorTap() async {
    final _route = MaterialPageRoute(
      builder: (context) =>
          CameraScreen(isForColorPicker: true),
    );
    await Navigator.of(context).push(_route);
  }

  _onScreenTap() {
    if (!_designScreenProvider.isOptionVisible) {
      _designScreenProvider.isOptionVisible = true;
    } else {
      _designScreenProvider.isOptionVisible = false;
    }
  }

  @override
  void initState() {
    _designScreenProvider = DesignScreenProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return EyeDrop(
      child: ChangeNotifierProvider<DesignScreenProvider>.value(
        value: _designScreenProvider,
        child: Consumer<DesignScreenProvider>(
          builder: (_, _designScreenProvider, __) {
            return Scaffold(
              body: Stack(
                children: [
                  GestureDetector(
                    onTap: _onScreenTap,
                    child: Container(
                      color: ColorConstants.white,
                      height: double.infinity,
                      width: double.infinity,
                      child: Image.file(
                        File(widget.imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  if (_designScreenProvider.isOptionVisible)
                    ImageButtonPallets(
                      designScreenProvider: _designScreenProvider,
                      isColorPicker: widget.isColorPicker,
                    ),
                  if (_designScreenProvider.isOptionVisible &&
                      (_designScreenProvider.bodyPart == CarEnum.carBody ||
                          _designScreenProvider.bodyPart == CarEnum.carRim ||
                          _designScreenProvider.isDoneBtnClicked))
                    _buildColorPallets(),
                  // ColorPallets(
                  //   isShowAddColorBtn: true,
                  //   designScreenProvider: _designScreenProvider,
                  //   isColorPicker: widget.isColorPicker,
                  // ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  _buildColorPallets() {
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
                            onTap: _onAddColorTap,
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
                            ? _designScreenProvider.temColorList.length
                            : ColorList.colors.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => onColorBtnTap(index),
                            child: Container(
                              margin: EdgeInsets.only(left: 8),
                              decoration: BoxDecoration(
                                color: ((_designScreenProvider.selectedIndex !=
                                            null) &&
                                        (_designScreenProvider.selectedIndex ==
                                            index))
                                    ? widget.isColorPicker
                                        ? _designScreenProvider
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
                                            ? _designScreenProvider
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
