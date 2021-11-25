import 'dart:io';

import 'package:cyclop/cyclop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../aspects/constants/color_constants.dart';
import '../../core/notifiers/design_screen_provider.dart';
import '../widgets/color_pallets.dart';
import '../widgets/color_picker_buttons_pallet.dart';

class ColorPickerScreen extends StatefulWidget {
  final bool isColorPicker;
  final String imagePath;

  ColorPickerScreen({
    required this.imagePath,
    required this.isColorPicker,
  });

  @override
  State<ColorPickerScreen> createState() => _ColorPickerScreenState();
}

class _ColorPickerScreenState extends State<ColorPickerScreen> {
  late DesignScreenProvider _designScreenProvider;

  /// this function is used for show and hide color pallets and
  /// button pallets show on editing screen
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
                    ColorPickerButtonsPallet(_designScreenProvider),
                  if (_designScreenProvider.isOptionVisible &&
                      _designScreenProvider.isDoneBtnClicked)
                    ColorPallets(
                      designScreenProvider: _designScreenProvider,
                      isColorPicker: widget.isColorPicker,
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
