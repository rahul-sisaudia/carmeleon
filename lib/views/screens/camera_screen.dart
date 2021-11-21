import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:carmeleon/core/helper/helper_imports.dart';
import 'package:carmeleon/views/widgets/camera_buttons_pallet.dart';
import 'display_picture_screen.dart';

class CameraScreen extends StatefulWidget {
  final bool isForColorPicker;

  CameraScreen({this.isForColorPicker = false});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>
    with WidgetsBindingObserver {
  CameraController? _cameraController;
  Future<void>? _initializeControllerFuture;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addObserver(this);

    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      _initializeControllerFuture = _initializeCamera();

      setState(() {});
    });
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  Future<void> _initializeCamera() async {
    List<CameraDescription> _cameras = await availableCameras();
    _cameraController = CameraController(
      _cameras.first,
      ResolutionPreset.medium,
    );

    return _cameraController?.initialize();
  }

  Future _getImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    return pickedFile;
  }

  _cameraBtnClicked() async {
    try {
      await _initializeControllerFuture;
      _cameraController?.setFlashMode(FlashMode.off);
      final _image = await _cameraController?.takePicture();
      if (_image != null) {
        RoutingHelper.pushToScreen(
          ctx: context,
          screen: DisplayPictureScreen(
            imagePath: _image.path,
            isColorPicker: widget.isForColorPicker,
          ),
        );
      }
    } catch (e) {
      print('_cameraBtnClicked error: $e');
    }
  }

  _libraryBtnClicked() async {
    try {
      await _initializeControllerFuture;
      final image = await _getImageFromGallery();
      if (image != null) {
        final _route = MaterialPageRoute(
          builder: (context) => DisplayPictureScreen(
            imagePath: image.path,
            isColorPicker: widget.isForColorPicker,
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return _buildCameraPreview();
          }
          return Text("Camera Initializing...");
        },
      ),
    );
  }

  Widget _buildCameraPreview() {
    final deviceRatio =
        DeviceSizeHelper.width(context) / DeviceSizeHelper.height(context);
    final controllerAspectRatio = _cameraController?.value.aspectRatio ?? 1;

    return Stack(
      children: <Widget>[
        Center(
          child: Transform.scale(
            scale: deviceRatio / controllerAspectRatio,
            child: new AspectRatio(
              aspectRatio: controllerAspectRatio,
              child: new CameraPreview(_cameraController!),
            ),
          ),
        ),
        CameraButtonsPallet(
          cameraBtnClicked: _cameraBtnClicked,
          libraryBtnClicked: _libraryBtnClicked,
        ),
      ],
    );
  }
}
