import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../aspects/constants/color_constants.dart';
import '../../aspects/enum/body_enum.dart';
import '../../core/notifiers/design_screen_provider.dart';
import '../widgets/color_pallets.dart';
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

  /// this function is used for show and hide color pallets and
  /// button pallets show on editing screen
  _onScreenTap() {
    if (!_designScreenProvider.isOptionVisible) {
      _designScreenProvider.isOptionVisible = true;
    } else {
      _designScreenProvider.isOptionVisible = false;
    }
  }

  /// this function is used for select car part from enum
  void _onSelectCarEnum() {
    if (_designScreenProvider.bodyPart != CarEnum.carRim) {
      _designScreenProvider.bodyPart = CarEnum.carRim;
    } else {
      _designScreenProvider.bodyPart = null;
    }
  }

  /// this function called when the user tap on add color button
  /// and this function navigate to the CameraScreen for
  /// choosing image fo picked colour from image
  _onAddColorTap() async {
    final route = MaterialPageRoute(
        builder: (context) => CameraScreen(isForColorPicker: true));
    Navigator.push(context, route).then((value) => setState(() {}));
  }

  @override
  void initState() {
    _designScreenProvider = DesignScreenProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DesignScreenProvider>.value(
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
                    onSelectCarEnum: _onSelectCarEnum,
                    designScreenProvider: _designScreenProvider,
                    isColorPicker: widget.isColorPicker,
                  ),
                if (_designScreenProvider.isOptionVisible &&
                    (_designScreenProvider.bodyPart == CarEnum.carBody ||
                        _designScreenProvider.bodyPart == CarEnum.carRim ||
                        _designScreenProvider.isDoneBtnClicked))
                  ColorPallets(onAddColorBtn: _onAddColorTap,
                    isShowAddColorBtn: true,
                    designScreenProvider: _designScreenProvider,
                    isColorPicker: widget.isColorPicker,
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
