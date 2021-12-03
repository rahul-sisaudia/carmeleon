import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/helpers/helper_imports.dart';
import '../widgets/camera_screen_buttons_pallet.dart';
import 'color_picker_screen.dart';
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

  /// this method is used for handle camera life cycle
  /// when app is in background then camera controller will be disposed
  /// and when resume app then camera reinitialize the camera controller
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // App state changed before we got the chance to initialize.
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive && !widget.isForColorPicker) {
      print('AppLifecycleState:$state');
      _cameraController?.dispose();
    } else if (state == AppLifecycleState.resumed && !widget.isForColorPicker) {
      print('AppLifecycleState:$state');
      if (_cameraController != null) {
        _initializeControllerFuture = _initializeCamera();
      }
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  /// in thi function initialize the camera controller
  /// and set the camera is first and also set the resolution is medium
  /// and return the camera controller initialization
  Future<void> _initializeCamera() async {
    var _cameras = await availableCameras();
    _cameraController = CameraController(
      _cameras.first,
      ResolutionPreset.medium,
    );

    return _cameraController?.initialize();
  }

  /// this function is used for take a image from device gallery
  /// and its type is XFile
  /// and return the picked file
  Future<XFile?> _getImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    return pickedFile;
  }

  /// this function is used for click image from device camera
  /// and pushed to the DisplayPictureScreen
  _cameraBtnClicked() async {
    try {
      await _initializeControllerFuture;
      _cameraController?.setFlashMode(FlashMode.off);
      final _image = await _cameraController?.takePicture();
      final _imageFile = (_image != null) ? File(_image.path) : null;
      if (_imageFile != null) {
        final _croppedFile = await AppHelper.cropImage(_imageFile);
        if (_croppedFile != null) {
          widget.isForColorPicker
              ? RoutingHelper.pushToScreen(
                  ctx: context,
                  screen: ColorPickerScreen(
                    imagePath: _croppedFile.path,
                    isColorPicker: widget.isForColorPicker,
                  ),
                )
              : RoutingHelper.pushToScreen(
                  ctx: context,
                  screen: DisplayPictureScreen(
                    imagePath: _croppedFile.path,
                    isColorPicker: widget.isForColorPicker,
                  ),
                );
        }
      }
    } on Exception catch (e) {
      print('_cameraBtnClicked error: $e');
    }
  }

  /// this function is used for call the _getImageFromGallery fuction
  /// and pushed to the DisplayPictureScreen
  _libraryBtnClicked() async {
    try {
      await _initializeControllerFuture;
      final _image = await _getImageFromGallery();
      final _imageFile = (_image != null) ? File(_image.path) : null;
      if (_imageFile != null) {
        final _croppedFile = await AppHelper.cropImage(_imageFile);
        if (_croppedFile != null) {
          widget.isForColorPicker
              ? RoutingHelper.pushToScreen(
                  ctx: context,
                  screen: ColorPickerScreen(
                    imagePath: _croppedFile.path,
                    isColorPicker: widget.isForColorPicker,
                  ),
                )
              : RoutingHelper.pushToScreen(
                  ctx: context,
                  screen: DisplayPictureScreen(
                    imagePath: _croppedFile.path,
                    isColorPicker: widget.isForColorPicker,
                  ),
                );
        }
      }
    } on Exception catch (e) {
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
            child: AspectRatio(
              aspectRatio: controllerAspectRatio,
              child: CameraPreview(_cameraController!),
            ),
          ),
        ),
        CameraScreenButtonsPallet(
          cameraBtnClicked: _cameraBtnClicked,
          libraryBtnClicked: _libraryBtnClicked,
        ),
      ],
    );
  }
}
