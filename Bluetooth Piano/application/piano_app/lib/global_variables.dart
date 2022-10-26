library gblox_mobile.globals;

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

late BluetoothConnection activeConnection;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
late ThemeData globalTheme = darkTheme;

Size device_size = MediaQuery.of(navigatorKey.currentContext!).size;
double device_status_bar_height =
    MediaQuery.of(navigatorKey.currentContext!).padding.top;
double cardSize = device_size.width * 0.4;
TextSize deviceText =
    TextSize(device_size.width * 0.0225, device_size.width * 0.02);

void updateDeviceSize() {
  device_size = MediaQuery.of(navigatorKey.currentContext!).size;
}

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

class ToolboxClass {
  String name;
  bool category;
  int index;
  String click;
  ToolboxClass(this.name, this.category, this.index, this.click);
}

class CardDetails {
  String svg;
  String title;
  Color textBackgroundColor;
  Function? pressed;
  bool compressSVG;

  CardDetails(this.svg, this.title, this.textBackgroundColor, this.pressed,
      this.compressSVG);
}

class SaveInformation {
  String xml;
  String device;
  String variables;
  String filename;
  String filepath;
  bool internal;

  SaveInformation(this.xml, this.device, this.variables, this.filename,
      this.filepath, this.internal);
}

class ShapeData {
  final String name;
  final String svg;
  final Path path;
  ShapeData(this.name, this.svg, this.path);
}

ThemeData darkTheme = ThemeData(
    primaryColor: Color.fromARGB(255, 0, 0, 0),
    colorScheme: const ColorScheme(
        primary: Color.fromARGB(255, 0, 0, 0),
        secondary: Color.fromARGB(255, 49, 49, 49),
        surface: Colors.black,
        background: Color.fromARGB(255, 0, 0, 0),
        error: Colors.red,
        onPrimary: Color.fromARGB(255, 109, 0, 0),
        onSecondary: Colors.white,
        onSurface: Colors.white,
        onBackground: Colors.white,
        onError: Colors.white,
        brightness: Brightness.light),
    fontFamily: "Baloo 2",
    appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 224, 82, 0),
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
            fontSize: 25,
            backgroundColor: Colors.transparent,
            fontFamily: "Baloo 2",
            color: Colors.white)),
    backgroundColor: Color.fromARGB(255, 0, 0, 0),
    scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
    drawerTheme:
        const DrawerThemeData(backgroundColor: Color.fromARGB(255, 224, 82, 0)),
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
