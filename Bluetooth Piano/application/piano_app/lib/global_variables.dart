library gblox_mobile.globals;

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

late BluetoothConnection activeConnection;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
late ThemeData globalTheme = darkTheme;

Size device_size = MediaQuery.of(navigatorKey.currentContext!).size;
TextSize deviceText =
    TextSize(device_size.width * 0.0225, device_size.width * 0.02);

class TextSize {
  double title;
  double normal;
  TextSize(this.title, this.normal);
}

class MusicKey {
  String name;
  int frequency;
  MusicKey(this.name, this.frequency);
}

ThemeData darkTheme = ThemeData(
    primaryColor: Color.fromARGB(255, 0, 0, 0),
    fontFamily: "Baloo 2",
    appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 255, 115, 0),
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
            fontSize: 25,
            backgroundColor: Colors.transparent,
            fontFamily: "Baloo 2",
            color: Colors.white)),
    backgroundColor: Color.fromARGB(255, 0, 0, 0),
    scaffoldBackgroundColor: Color.fromARGB(147, 56, 56, 56),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color.fromARGB(255, 255, 115, 0),
    ),
    cardTheme: const CardTheme(
        shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(16.0),
      ),
    )),
    textTheme: const TextTheme(
      bodyText1: TextStyle(fontFamily: "Baloo 2"),
    ).apply(
      bodyColor: Colors.white,
      displayColor: Colors.blue,
    ));
