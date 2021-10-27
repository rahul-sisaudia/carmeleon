import 'dart:async';

import 'package:camera/camera.dart';
import 'package:carmeleon/views/widgets/camera_button_pallets.dart';
import 'package:flutter/material.dart';
import 'package:native_device_orientation/native_device_orientation.dart';

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    Key key,
    this.camera,
  }) : super(key: key);
  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.ultraHigh,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NativeDeviceOrientationReader(
        useSensor: true,
        builder: (context) {
          return Stack(
            children: [
              Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: CameraPreview(_controller)),
              CameraButtonPallets(_initializeControllerFuture, _controller),
            ],
          );
        },
      ),
    );
  }
}
