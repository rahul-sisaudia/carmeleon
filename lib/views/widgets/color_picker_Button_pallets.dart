import 'package:cyclop/cyclop.dart';
import 'package:flutter/material.dart';

import 'build_buttons_view.dart';
import '../../aspects/constants/contant_imports.dart';
import '../../core/helper/helper_imports.dart';
import '../../core/notifiers/design_screen_provider.dart';

class ColorPickerButtonPallets extends StatefulWidget {
  final DesignScreenProvider designScreenProvider;

  ColorPickerButtonPallets(this.designScreenProvider);

  @override
  _ColorPickerButtonPalletsState createState() =>
      _ColorPickerButtonPalletsState();
}

class _ColorPickerButtonPalletsState extends State<ColorPickerButtonPallets> {
  void onAddNewColor(value) {
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

  void onDeleteColor() {
    widget.designScreenProvider.temColorList
        .removeAt(widget.designScreenProvider.selectedIndex);
    widget.designScreenProvider.selectedIndex = null;
  }

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
