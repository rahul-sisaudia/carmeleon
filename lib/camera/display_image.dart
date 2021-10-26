import 'dart:io';

import 'package:carmeleon/camera/widgets/image_button_pallets.dart';
import 'package:carmeleon/camera/widgets/color_pallets.dart';
import 'package:carmeleon/notifier/provider.dart';
import 'package:carmeleon/utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;

  DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

  @override
  State<DisplayPictureScreen> createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ButtonController(),
      child: Consumer<ButtonController>(
        builder: (_, buttonController, __) {
          return Scaffold(
            body: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (!_isVisible)
                        _isVisible = true;
                      else {
                        _isVisible = false;
                      }
                    });
                  },
                  child: Container(
                    color: ColorConstants.white,
                    height: double.infinity,
                    width: double.infinity,
                    child: Image.file(
                      File(
                        widget.imagePath,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                if (_isVisible) ImageButtonPallets(),
                if (_isVisible
                //&& buttonController.isShowColorPallets
                )
                  ColorPallets(),
              ],
            ),
          );
        },
      ),
    );
  }
}
