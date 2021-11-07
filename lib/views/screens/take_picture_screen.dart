import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:carmeleon/aspects/constants/device_size.dart';
import 'package:carmeleon/views/widgets/camera_button_pallets.dart';

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({Key? key}) : super(key: key);

  @override
  _TakePictureScreenState createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends State<TakePictureScreen>
    with WidgetsBindingObserver {
  CameraController? controller;
  Future<void>? _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addObserver(this);

    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      _initializeControllerFuture = initializeCamera();

      setState(() {});
    });
  }

  Future<void> initializeCamera() async {
    List<CameraDescription> _cameras = await availableCameras();
    controller = CameraController(
      _cameras.first,
      ResolutionPreset.medium,
    );

    return controller?.initialize();
  }

  @override
  void dispose() {
    controller?.dispose();
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return getCameraPreview();
          }
          return Text("Camera Initializing...");
        },
      ),
    );
  }

  Widget getCameraPreview() {
    final deviceRatio = DeviceSize.width(context) / DeviceSize.height(context);
    final controllerAspectRatio = controller?.value.aspectRatio ?? 1;

    return Stack(
      children: <Widget>[
        Center(
          child: Transform.scale(
            scale: deviceRatio / controllerAspectRatio,
            child: new AspectRatio(
              aspectRatio: controllerAspectRatio,
              child: new CameraPreview(controller!),
            ),
          ),
        ),
        CameraButtonPallets(_initializeControllerFuture!, controller!),
      ],
    );
  }
}
