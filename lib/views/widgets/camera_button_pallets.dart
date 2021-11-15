import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../aspects/constants/color_constants.dart';
import '../../aspects/constants/device_size.dart';
import '../../core/helpers/helper_imports.dart';
import '../screens/display_picture_screen.dart';

class CameraButtonPallets extends StatefulWidget {
  final CameraController cameraController;
  final Future<void> _initializeControllerFuture;

  CameraButtonPallets(this._initializeControllerFuture, this.cameraController);

  @override
  State<CameraButtonPallets> createState() => _CameraButtonPalletsState();
}

class _CameraButtonPalletsState extends State<CameraButtonPallets> {
  final ImagePicker _picker = ImagePicker();

  _cameraBtnClicked() async {
    try {
      await widget._initializeControllerFuture;
      widget.cameraController.setFlashMode(FlashMode.off);
      final _pickedFile = await widget.cameraController.takePicture();
      var _imageFile = File(_pickedFile.path);
      final _croppedFile = await AppHelper().cropImage(_imageFile);
      if (_croppedFile != null) {
        RoutingHelper.pushToScreen(
          ctx: context,
          screen: DisplayPictureScreen(imagePath: _croppedFile.path),
        );
      }
    } on Exception catch (e) {
      print('_cameraBtnClicked error: $e');
    }
  }

  _libraryBtnClicked() async {
    try {
      await widget._initializeControllerFuture;
      final _pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      var _imageFile = _pickedFile != null ? File(_pickedFile.path) : null;
      if (_imageFile != null) {
        final _croppedFile = await AppHelper().cropImage(_imageFile);
        if (_croppedFile != null) {
          RoutingHelper.pushToScreen(
            ctx: context,
            screen: DisplayPictureScreen(imagePath: _croppedFile.path),
          );
        }
      }
    } on Exception catch (e) {
      print('_libraryBtnClicked error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: DeviceSize.width(context) / 100,
      top: DeviceSize().height(context) / 2.6,
      child: Container(
        decoration: BoxDecoration(
          color: ColorConstants.transparentWhite,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, right: 8, left: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: _cameraBtnClicked,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorConstants.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.camera_enhance_outlined,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: _libraryBtnClicked,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorConstants.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.photo_library_outlined,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
