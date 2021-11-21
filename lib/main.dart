import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:carmeleon/views/screens/splash_screen.dart';
import 'core/notifiers/design_screen_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Enable full screen mode for the app
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  // Fix camera orientation
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DesignScreenProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
