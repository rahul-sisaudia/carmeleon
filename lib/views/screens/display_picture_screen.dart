import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

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
  bool _isLongPress = true;
  CarEnum? _bodyPart;

  /// this function is used for show and hide color pallets and
  /// button pallets show on editing screen
  _onScreenTap() {
    setState(() {
      _isOptionVisible = !_isOptionVisible;
    });
  }

  _onLongPress() {
    setState(() {
      _isLongPress = !_isLongPress;
    });
  }

  /// this function is used for select car part from enum
  void _onSelectCarEnum(CarEnum carEnum) {
    setState(() {
      _bodyPart = carEnum;
    });
  }

  Future<void> _onSaveImage() async {
    final result = await ImageGallerySaver.saveFile(
      widget.imagePath,
      name: 'new image',
    );
    // final String path = directory.path;
    //
    // var tmpFile = File(widget.imagePath);
    // tmpFile = await tmpFile.copy(tmpFile.path);
    print('File save Location: $result');
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
            onLongPressStart: (details) {
              _onLongPress();
            },
            onLongPressEnd: (details) {
              _onLongPress();
            },
            onTap: _onScreenTap,
            child: Container(
              color: ColorConstants.white,
              height: double.infinity,
              width: double.infinity,
              child: Image.file(
                File(
                    _isLongPress ? widget.imagePath : 'assets/images/logo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (_isOptionVisible)
            DisplayScreenMainButtonPallets(
              onSelectCarEnum: _onSelectCarEnum,
              isColorPicker: widget.isColorPicker,
              onSaveBtnClicked: _onSaveImage,
              bodyPart: _bodyPart,
            ),
          if (_isOptionVisible && (_bodyPart != null))
            ColorsPallet(
              onAddColorBtn: _onAddColorTap,
              isShowAddColorBtn: true,
              isColorPicker: widget.isColorPicker,
              bodyPart: _bodyPart,
            ),
        ],
      ),
    );
  }
}
