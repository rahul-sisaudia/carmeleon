import 'dart:io';

import 'package:flutter/material.dart';

import '../../aspects/constants/color_constants.dart';
import '../../aspects/enum/body_enum.dart';
import '../widgets/colors_pallet.dart';
import '../widgets/display_screen_main_button_pallets.dart';
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
  bool _isOptionVisible = true;
  CarEnum? _bodyPart;

  /// this function is used for show and hide color pallets and
  /// button pallets show on editing screen
  _onScreenTap() {
    setState(() {
      _isOptionVisible = !_isOptionVisible;
    });
  }

  /// this function is used for select car part from enum
  void _onSelectCarEnum(CarEnum carEnum) {
    setState(() {
      _bodyPart = carEnum;
    });
  }

  /// this function called when the user tap on add color button
  /// and this function navigate to the CameraScreen for
  /// choosing image fo picked colour from image
  _onAddColorTap() async {
    final route = MaterialPageRoute(
      builder: (context) => CameraScreen(isForColorPicker: true),
    );
    Navigator.push(context, route).then((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
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
          if (_isOptionVisible)
            DisplayScreenMainButtonPallets(
              onSelectCarEnum: _onSelectCarEnum,
              isColorPicker: widget.isColorPicker,
              selBodyPart: _bodyPart,
            ),
          if (_isOptionVisible && (_bodyPart != null))
            ColorsPallet(
              addColorBtnTapped: _onAddColorTap,
              isShowAddColorBtn: true,
              isColorPicker: widget.isColorPicker,
              selBodyPart: _bodyPart,
            ),
        ],
      ),
    );
  }
}
