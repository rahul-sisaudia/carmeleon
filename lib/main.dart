import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'camera/camera_stream.dart';
import 'notifier/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeRight]);
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<ButtonController>(
            create: (_) => ButtonController()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: TakePictureScreen(camera: firstCamera))));
}
