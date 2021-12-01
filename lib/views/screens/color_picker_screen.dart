import 'dart:io';

import 'package:cyclop/cyclop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../aspects/constants/color_constants.dart';
import '../../core/notifiers/design_screen_provider.dart';
import '../widgets/colors_pallet.dart';
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
  bool _isOptionVisible = true;

  /// this function is used for show and hide color pallets and
  /// button pallets show on editing screen
  _onScreenTap() {
    setState(() {
      _isOptionVisible = !_isOptionVisible;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _designScreenProvider = Provider.of<DesignScreenProvider>(context);
    return EyeDrop(
      child: Scaffold(
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
            if (_isOptionVisible)
              ColorPickerButtonsPallet(_designScreenProvider),
            if (_isOptionVisible && _designScreenProvider.isDoneBtnClicked)
              ColorsPallet(isColorPicker: widget.isColorPicker),
          ],
        ),
      ),
    );
  }
}
