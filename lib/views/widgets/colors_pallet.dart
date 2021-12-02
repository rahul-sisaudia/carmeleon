import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../aspects/constants/constant_imports.dart';
import '../../aspects/enum/body_enum.dart';
import '../../core/helpers/helper_imports.dart';
import '../../core/modals/car_history_modal.dart';
import '../../core/notifiers/design_screen_provider.dart';

class ColorsPallet extends StatefulWidget {
  final bool isShowAddColorBtn;
  final bool isColorPicker;
  final bool isDoneBtnClicked;
  final VoidCallback? onAddColorBtn;
  final CarEnum? bodyPart;

  ColorsPallet({
    this.isShowAddColorBtn = false,
    this.isColorPicker = false,
    this.isDoneBtnClicked = false,
    this.onAddColorBtn,
    this.bodyPart,
  });

  @override
  State<ColorsPallet> createState() => _ColorsPalletState();
}

class _ColorsPalletState extends State<ColorsPallet> {
  late DesignScreenProvider _designScreenProvider;
  final _controller = ScrollController();
double _move=0.0;
  /// this function takes  integer index value
  /// tap on any color then the index value of that color will be sett as
  /// selected index
  /// and add the store thr selection of car parts with color in history list
  void _onColorBtnTap(int index) {
    _designScreenProvider.selectedIndex = index;
    setState(() {});
    if ((!_designScreenProvider.isDoneBtnClicked) &&
        (widget.bodyPart != null)) {
      final _hist = CarHistoryData(
        colorCode: ColorList.colorsList[index].toString(),
        bodyPart: widget.bodyPart,
      );
      _designScreenProvider.historyList.add(_hist);
      // //<<<<<<<<<<<<<<<<<<<<<<<< print List Data>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
      //
      // for (var i = 0; i < _designScreenProvider.historyList.length; i++) {
      //   print('${_designScreenProvider.historyList[i].bodyPart} => '
      //       '${_designScreenProvider.historyList[i].colorCode}');
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    _designScreenProvider = Provider.of<DesignScreenProvider>(context);
    return Positioned(
      left: 20,
      right: 100,
      bottom: 5,
      top: DeviceSizeHelper.height(context) / 1.18,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: (){
                if(_move>_controller.position.minScrollExtent){
                  _move-=30;
                }
                _controller.animateTo(

                  _move  ,
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 500),
                );

              },
              child: Container(
                height: DeviceSizeHelper.height(context) / Dimensions.px8,
                width: DeviceSizeHelper.height(context) / Dimensions.px9,
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
                        controller: _controller,
                        scrollDirection: Axis.horizontal,
                        itemCount:

                        widget.isColorPicker
                            ? _designScreenProvider.temColorList.length
                            : ColorList.colorsList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => _onColorBtnTap(index),
                            child: Container(
                              margin: EdgeInsets.only(left: 8),
                              decoration: BoxDecoration(
                                color:
                                ((_designScreenProvider.selectedIndex !=
                                    null) &&
                                    (_designScreenProvider.selectedIndex ==
                                        index))
                                    ? widget.isColorPicker
                                    ?
                                _designScreenProvider
                                    .temColorList[index]
                                    :
                                ColorList.colorsList[index]
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
                                        color:
                                        widget.isColorPicker
                                            ?
                                        _designScreenProvider
                                            .temColorList[index]
                                            : ColorList.colorsList[index],
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
            child: GestureDetector(
              onTap:() {
                if(_move<_controller.position.maxScrollExtent){
                  _move+=30;
                }
                _controller.animateTo(

                  _move  ,
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 500),
                );


              },
              child: Container(
                height: DeviceSizeHelper.height(context) / Dimensions.px8,
                width: DeviceSizeHelper.height(context) / Dimensions.px9,
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
          ),
        ],
      ),
    );
  }
}
