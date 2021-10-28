import 'dart:io';

import 'package:carmeleon/aspects/constants/color_constants.dart';
import 'package:carmeleon/views/widgets/color_pallets.dart';
import 'package:carmeleon/views/widgets/image_button_pallets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;

  DisplayPictureScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  State<DisplayPictureScreen> createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
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
          if (_isVisible) ColorPallets(),
        ],
      ),
    );
  }
}
