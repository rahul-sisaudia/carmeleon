// ignore_for_file: must_be_immutable

import 'package:camera/camera.dart';
import 'package:carmeleon/utils/color_constants.dart';
import 'package:carmeleon/utils/device_size.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../views/screens/display_image.dart';

class CameraButtonPallets extends StatefulWidget {
  CameraButtonPallets(this._initializeControllerFuture, this._controller);
  CameraController _controller;
  Future<void> _initializeControllerFuture;
  @override
  State<CameraButtonPallets> createState() => _CameraButtonPalletsState();
}

class _CameraButtonPalletsState extends State<CameraButtonPallets> {
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    return pickedFile;
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
                onTap: () async {
                  try {
                    await widget._initializeControllerFuture;
                    widget._controller.setFlashMode(FlashMode.off);
                    final image = await widget._controller.takePicture();
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DisplayPictureScreen(
                          imagePath: image.path,
                        ),
                      ),
                    );
                  } catch (e) {
                    print(e);
                  }
                },
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
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  try {
                    await widget._initializeControllerFuture;
                    final image = await getImage();
                    if (image != null)
                      await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DisplayPictureScreen(
                            imagePath: image.path,
                          ),
                        ),
                      );
                  } catch (e) {
                    print(e);
                  }
                },
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
