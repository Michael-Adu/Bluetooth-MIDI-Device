import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:signal_strength_indicator/signal_strength_indicator.dart';

import 'global_variables.dart' as global;

class BluetoothCard extends StatefulWidget {
  @required
  BluetoothDevice? device;
  String? type;
  GestureTapCallback? onTap;
  GestureLongPressCallback? onLongPress;
  bool? enabled;
  int? rssi;
  BluetoothCard(
      {Key? key,
      this.device,
      this.type,
      this.onTap,
      this.enabled,
      this.onLongPress,
      this.rssi});

  @override
  State<StatefulWidget> createState() {
    return _BluetoothCardState();
  }
}

class _BluetoothCardState extends State<BluetoothCard> {
  late String _cardSVG;
  late Color _textBackgroundColor;
  double rssi = 0;

  _BluetoothCardState();

  void initState() {
    super.initState();
    print(widget.rssi);
    if (widget.rssi! != 0) {
      rssi = 4 / ((-widget.rssi!) / (10)) * 4;
    } else {
      rssi = 0;
    }
  }

  Widget build(BuildContext context) {
    return (InkWell(
        onLongPress: widget.onLongPress,
        onTap: () {
          widget.onTap!();
        },
        child: Container(
            height: 200,
            width: 200,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    clipBehavior: Clip.antiAlias,
                    color: Theme.of(global.navigatorKey.currentContext!)
                        .colorScheme
                        .secondary,
                    shape: const BeveledRectangleBorder(
                      side: BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255), width: 1),
                    ),
                    child: Container(
                        width: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(global.navigatorKey.currentContext!)
                              .colorScheme
                              .primaryVariant,
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 35, 0, 0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: global.device_size.width * 0.2,
                                          height:
                                              global.device_size.height * 0.3,
                                        ),
                                        Column(children: [
                                          widget.device!.isConnected
                                              ? const Icon(Icons.import_export,
                                                  color: Colors.green)
                                              : Container(),
                                          widget.enabled!
                                              ? const Icon(Icons.link,
                                                  color: Colors.white)
                                              : Container()
                                        ])
                                      ])),
                              Container(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                    Text(widget.device!.address,
                                        style: TextStyle(color: Colors.white)),
                                    widget.rssi! != 0
                                        ? Container(
                                            width:
                                                global.device_size.width * 0.05,
                                            child: SignalStrengthIndicator.bars(
                                              value: rssi,
                                              minValue: 1,
                                              maxValue: 4,
                                              size: global.device_size.height *
                                                  0.1,
                                              barCount: 4,
                                              spacing: 0.1,
                                              inactiveColor: Colors.grey[900],
                                              activeColor: Colors.green,
                                            ),
                                          )
                                        : Container()
                                  ])),
                              Container(
                                  width: 500,
                                  alignment: Alignment.center,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.blueAccent)),
                                  child: Text(widget.device!.name.toString()))
                            ])))))));
  }
}
