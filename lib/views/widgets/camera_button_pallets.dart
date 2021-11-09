import 'package:camera/camera.dart';
import 'package:carmeleon/aspects/constants/color_constants.dart';
import 'package:carmeleon/aspects/constants/device_size.dart';
import 'package:carmeleon/views/screens/display_picture_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraButtonPallets extends StatefulWidget {
  final bool isColorPicker;
  final CameraController cameraController;
  final Future<void> _initializeControllerFuture;

  CameraButtonPallets(this._initializeControllerFuture, this.cameraController,
      this.isColorPicker);

  @override
  State<CameraButtonPallets> createState() => _CameraButtonPalletsState();
}

class _CameraButtonPalletsState extends State<CameraButtonPallets> {
  final ImagePicker _picker = ImagePicker();

  Future _getImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    return pickedFile;
  }

  _cameraBtnClicked() async {
    try {
      await widget._initializeControllerFuture;
      widget.cameraController.setFlashMode(FlashMode.off);
      final image = await widget.cameraController.takePicture();
      final _route = MaterialPageRoute(
        builder: (context) => DisplayPictureScreen(
          imagePath: image.path,
          isColorPicker: widget.isColorPicker,
        ),
      );
      Navigator.of(context).push(_route);
    } catch (e) {
      print('_cameraBtnClicked error: $e');
    }
  }

  _libraryBtnClicked() async {
    try {
      await widget._initializeControllerFuture;
      final image = await _getImageFromGallery();
      if (image != null) {
        final _route = MaterialPageRoute(
          builder: (context) => DisplayPictureScreen(
            imagePath: image.path,
            isColorPicker: widget.isColorPicker,
          ),
        );
        await Navigator.of(context).push(_route);
      }
    } catch (e) {
      print('_libraryBtnClicked error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: DeviceSize.width(context) / 100,
      top: DeviceSize.height(context) / 2.6,
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
