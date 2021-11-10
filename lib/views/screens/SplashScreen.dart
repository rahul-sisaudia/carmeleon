import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen();
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _initializationComplete = false;

  void initializeNetwork() async {
    ///ToDo : The time duration is to simulate network connection
    ///Replace this with proper backend connectivity
    Timer(Duration(seconds: 2), () {
      setState(() {
        _initializationComplete = true;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    initializeNetwork();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              height: 300.0,
              width: 300.0,
            ),
          ),

          ///TODO: Replace this with appropriate widget/animation to navigate
          ///to the next screen. If Login is implemeted navigate to login screen
          ///else to the CameraPreview Screen
          Center(
            child: _initializationComplete
                ? TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/cameraPreview/");
                    },
                    child: Text("READY! =>"),
                  )
                : CircularProgressIndicator(),
          )
        ],
      ),
    ));
  }
}
