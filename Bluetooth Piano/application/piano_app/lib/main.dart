import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "home.dart";
import "global_variables.dart" as global;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Piano Appp',
      navigatorKey: global.navigatorKey,
      theme: global.darkTheme,
      home: Home(),
    );
  }
}
