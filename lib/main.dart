import 'package:camera/camera.dart';
import 'package:carmeleon/views/screens/take_picture_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TakePictureScreen(camera: firstCamera)));
}
