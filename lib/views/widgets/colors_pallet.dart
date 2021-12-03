import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../aspects/constants/constant_imports.dart';
import '../../aspects/enum/body_enum.dart';
import '../../core/modals/car_history_modal.dart';
import '../../core/notifiers/design_screen_provider.dart';

class ColorsPallet extends StatefulWidget {
  final bool isShowAddColorBtn;
  final bool isColorPicker;
  final VoidCallback? addColorBtnTapped;
  final CarEnum? selBodyPart;

  ColorsPallet({
    this.isShowAddColorBtn = false,
    this.isColorPicker = false,
    this.addColorBtnTapped,
    this.selBodyPart,
  });

  @override
  State<ColorsPallet> createState() => _ColorsPalletState();
}

class _ColorsPalletState extends State<ColorsPallet> {
  late DesignScreenProvider _designScreenProvider;
  final _scrollController = ScrollController();
  double _move = 0.0;
  final double _height = 55;

  /// this function takes  integer index value
  /// tap on any color then the index value of that color will be sett as
  /// selected index
  /// and add the store thr selection of car parts with color in history list
  void _onColorBtnTap(int index) {
    _designScreenProvider.selectedIndex = index;
    setState(() {});
    if ((!_designScreenProvider.isDoneBtnClicked) &&
        (widget.selBodyPart != null)) {
      final _hist = CarHistoryData(
        colorCode: ColorList.colorsList[index].toString(),
        bodyPart: widget.selBodyPart,
      );
      _designScreenProvider.historyList.add(_hist);
    }
  }

  @override
  Widget build(BuildContext context) {
    _designScreenProvider = Provider.of<DesignScreenProvider>(context);
    return Positioned(
      left: Dimensions.px10,
      right: Dimensions.px80,
      bottom: Dimensions.px10,
      height: _height,
      child: Row(
        children: [
          _buildArrowView(
            icon: Icons.chevron_left,
            onTap: () {
              if (_move > _scrollController.position.minScrollExtent) {
                _move -= _height;
              }
              _scrollController.animateTo(
                _move,
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 500),
              );
            },
          ),
          SizedBox(width: Dimensions.px10),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(Dimensions.px15),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    if (widget.isShowAddColorBtn) _buildAddBtnView(),
                    Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.isColorPicker
                            ? _designScreenProvider.temColorList.length
                            : ColorList.colorsList.length,
                        itemBuilder: (context, index) {
                          return _buildColorViewFor(index: index);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: Dimensions.px10),
          _buildArrowView(
            icon: Icons.chevron_right,
            onTap: () {
              if (_move < _scrollController.position.maxScrollExtent) {
                _move += _height;
              }
              _scrollController.animateTo(
                _move,
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 500),
              );
            },
          ),
        ],
      ),
    );
  }

  _buildColorViewFor({required int index}) {
    return GestureDetector(
      onTap: () => _onColorBtnTap(index),
      child: Container(
        margin: EdgeInsets.only(left: 8),
        decoration: BoxDecoration(
          color: ((_designScreenProvider.selectedIndex != null) &&
                  (_designScreenProvider.selectedIndex == index))
              ? widget.isColorPicker
                  ? _designScreenProvider.temColorList[index]
                  : ColorList.colorsList[index]
              : ColorConstants.white,
          borderRadius: BorderRadius.circular(Dimensions.px20),
        ),
        child: Container(
          padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            color: ColorConstants.white,
            borderRadius: BorderRadius.circular(Dimensions.px20),
          ),
          child: Container(
            width: Dimensions.px35,
            decoration: BoxDecoration(
              color: widget.isColorPicker
                  ? _designScreenProvider.temColorList[index]
                  : ColorList.colorsList[index],
              borderRadius: BorderRadius.circular(Dimensions.px40),
            ),
          ),
        ),
      ),
    );
  }

  _buildAddBtnView() {
    return GestureDetector(
      onTap: widget.addColorBtnTapped,
      child: Container(
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          color: ColorConstants.white,
          borderRadius: BorderRadius.circular(Dimensions.px20),
        ),
        child: const Icon(
          Icons.add,
          size: Dimensions.px40,
          color: Colors.black,
        ),
      ),
    );
  }

  _buildArrowView({
    required VoidCallback onTap,
    required IconData icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Dimensions.px50,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(Dimensions.px15),
        ),
        child: Icon(
          icon,
          size: Dimensions.px40,
          color: Colors.black,
        ),
      ),
    );
  }
}
