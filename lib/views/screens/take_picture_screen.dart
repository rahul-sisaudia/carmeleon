import 'package:camera/camera.dart';
import 'package:carmeleon/constants/device_size.dart';
import 'package:carmeleon/views/widgets/camera_button_pallets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({Key? key}) : super(key: key);

  @override
  _TakePictureScreenState createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends State<TakePictureScreen>
    with WidgetsBindingObserver {
  CameraController? controller;
  List<CameraDescription> cameras = [];
  Future<void>? _initializeControllerFuture;
  int selectedCamera = 0;

  Future<void> initializeCamera(int cameraIndex) async {
    cameras = await availableCameras();
    controller = CameraController(
      cameras[cameraIndex],
      ResolutionPreset.medium,
    );

    return controller!.initialize();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    print("Init!");
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    _initializeControllerFuture = initializeCamera(0);
    print("Camera Initializing ....");
  }

  //ToDo: Implement camera re-initialization on AppState change.
  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   // App state changed before we got the chance to initialize.
  //   if (state == AppLifecycleState.paused) {
  //     controller!.dispose();
  //     print('AppLifecycleState:$state');
  //   } else if (state == AppLifecycleState.resumed) {
  //    initializeCamera(0);
  //     print('AppLifecycleState:$state');
  //   }
  // }

  @override
  void dispose() {
    controller!.dispose();
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  Widget getCameraPreview() {
    final deviceRatio = DeviceSize.width(context) / DeviceSize.height(context);
    final controllerAspectRatio = controller!.value.aspectRatio;
    print(controller.toString());
    return Stack(
      children: <Widget>[
        Center(
          child: Transform.scale(
            //ToDo: Test on more devices and screen sizes to confirm the scaling factor
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
}
