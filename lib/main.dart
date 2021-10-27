import 'package:camera/camera.dart';
import 'package:carmeleon/utils/app_life_cycle_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'views/screens/camera_stream.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp(AppLifeCycleManager(
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TakePictureScreen(camera: firstCamera)),
  ));
}
