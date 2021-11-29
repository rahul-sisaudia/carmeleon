import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../aspects/constants/constant_imports.dart';
import '../../core/helpers/helper_imports.dart';
import '../../core/shared_preference/preference_connector.dart';
import 'camera_screen.dart';

class SplashScreen extends StatefulWidget {
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

  _checkSharedPreferenceData() async {
    PreferenceConnector.preferenceInitializer();
    var prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('colorData')) {
      var data = await PreferenceConnector.getColor();
      for (var i = 0; i < data!.length; i++) {
        var valueString = data[i].split('(0x')[1].split(')')[0];
        var value = int.parse(valueString, radix: 16);
        ColorList.colorsList.add(Color(value));
        print(Color(value));
      }
      print(data.toString());
    } else {
      for (var i = 0; i < ColorList.stringColorList.length; i++) {
        var valueString =
            ColorList.stringColorList[i].split('(0x')[1].split(')')[0];
        var value = int.parse(valueString, radix: 16);
        ColorList.colorsList.add(Color(value));
      }
    }
  }

  @override
  void initState() {
    _checkSharedPreferenceData();
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
              ImageConstants.imageSplashScreenPng,
              height: 300.0,
              width: 300.0,
            ),
          ),

          ///TODO: Replace this with appropriate widget/animation to navigate
          ///to the next screen. If Login is
          /// implemented navigate to login screen
          ///else to the CameraPreview Screen
          Center(
            child: _initializationComplete
                ? TextButton(
                    onPressed: () {
                      RoutingHelper.pushAndRemoveUntilToScreen(
                          ctx: context, screen: CameraScreen());
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
