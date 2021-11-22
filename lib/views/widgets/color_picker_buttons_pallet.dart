import 'package:cyclop/cyclop.dart';
import 'package:flutter/material.dart';

import '../../aspects/constants/contant_imports.dart';
import '../../core/helpers/helper_imports.dart';
import '../../core/notifiers/design_screen_provider.dart';
import 'build_buttons_view.dart';

class ColorPickerButtonsPallet extends StatefulWidget {
  final DesignScreenProvider designScreenProvider;

  ColorPickerButtonsPallet(this.designScreenProvider);

  @override
  _ColorPickerButtonsPalletState createState() =>
      _ColorPickerButtonsPalletState();
}

class _ColorPickerButtonsPalletState extends State<ColorPickerButtonsPallet> {

  /// this function takes color value from color picker
  /// first this function check which index is selected then replace the color
  /// with selected index color otherwise add as a new color in color pallets

  void onAddNewColor(dynamic value) {
    if (widget.designScreenProvider.selectedIndex != null) {
      widget.designScreenProvider.temColorList
          .removeAt(widget.designScreenProvider.selectedIndex);
      widget.designScreenProvider.temColorList
          .insert(widget.designScreenProvider.selectedIndex!, value);
      widget.designScreenProvider.selectedIndex =
          widget.designScreenProvider.tempColorListLength;
    } else {
      widget.designScreenProvider.temColorList.add(value);
      widget.designScreenProvider.selectedIndex =
          widget.designScreenProvider.tempColorListLength;
    }
  }

  /// this function is called when delete the color from color pallets
  /// and sett the selected index is null
  void onDeleteColor() {
    widget.designScreenProvider.temColorList
        .removeAt(widget.designScreenProvider.selectedIndex);
    widget.designScreenProvider.selectedIndex = null;
  }

  /// this function is called when save the color selection
  /// function copy  the temp list data to the ColorList.color
  void onDoneBtnClicked() {
    ColorList.colors = List.from(widget.designScreenProvider.temColorList);
    print('colorList item:${ColorList.colors.length}');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BuildButtonsView(
          icon: EyedropperButton(
            iconColor: ColorConstants.black,
            icon: Icons.colorize,
            onColor: (value) {
              setState(() {
                onAddNewColor(value);
              });
            },
          ),
        ),
        GestureDetector(
          onTap: () {
            if (widget.designScreenProvider.selectedIndex != null) {
              AppHelper.showSimpleDialogue(
                onClick: () {
                  onDeleteColor();
                },
                showNoButton: true,
                showOkayButton: true,
                cancelBtnTitle: 'Cancel',
                title: 'Alert',
                message: 'Do you want to delete the color',
                okBtnTitle: 'Delete',
                context: context,
              );
            } else {
              AppHelper.showSimpleDialogue(
                showNoButton: true,
                title: 'Alert',
                message: 'Please Select the color from color pallets',
                cancelBtnTitle: 'Close',
                context: context,
              );
            }
          },
          child: BuildButtonsView(
            icon: const Icon(
              Icons.delete_outline,
              size: Dimensions.px35,
              color: Colors.black,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            AppHelper.showSimpleDialogue(
              onClick: () {
                onDoneBtnClicked();
              },
              showNoButton: true,
              showOkayButton: true,
              cancelBtnTitle: 'Discard',
              title: 'Alert',
              message: 'Do you want to save the changes',
              okBtnTitle: 'Save',
              context: context,
            );
          },
          child: BuildButtonsView(
            icon: const Icon(
              Icons.done_rounded,
              size: Dimensions.px35,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
