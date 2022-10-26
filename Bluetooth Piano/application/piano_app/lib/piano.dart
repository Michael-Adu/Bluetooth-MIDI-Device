import 'package:flutter/material.dart';
import 'global_variables.dart' as global;
import 'dart:convert';
import 'dart:typed_data';

class _KeyClass {
  global.MusicKey pKey;
  bool acc;
  bool empty;

  _KeyClass(this.pKey, this.acc, this.empty);
}

class Piano extends StatefulWidget {
  late List<global.MusicKey>? keys;
  Piano({
    Key? key,
    this.keys,
  }) : super(key: key);

  @override
  _PianoState createState() => _PianoState();
}

class _PianoState extends State<Piano> {
  late List<_KeyClass> notes = List<_KeyClass>.empty(growable: true);
  late List<_KeyClass> accidentals = List<_KeyClass>.empty(growable: true);

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < widget.keys!.length; i++) {
      if (widget.keys![i].name.contains("#")) {
        accidentals.add(_KeyClass(widget.keys![i], true, false));
      } else {
        try {
          var lastAcc = accidentals.last;
          //print(widget.keys[i][0]);
          if (widget.keys![i - 1].name.contains(lastAcc.pKey.name[0])) {
            notes.add(_KeyClass(widget.keys![i], false, false));
          } else {
            accidentals.add(_KeyClass(widget.keys![i], true, true));
            notes.add(_KeyClass(widget.keys![i], false, false));
          }
        } catch (e) {
          //print(accidental);
          notes.add(_KeyClass(widget.keys![i], false, false));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      Size windowSize = Size(constraints.maxWidth, constraints.maxHeight);
      return Container(
          width: windowSize.width * 1,
          child: Stack(
            children: [
              Container(
                  height: windowSize.height * 1,
                  child: Row(
                    children: notes
                        .map((e) => PianoKey(
                              accidental: e.acc,
                              pianoKey: e.pKey.name,
                              empty: e.empty,
                              keyWidth: (windowSize.width * 1.62) /
                                  widget.keys!.length,
                              pressed: () {
                                try {
                                  global.activeConnection.output.add(
                                      Uint8List.fromList(utf8.encode(
                                          e.pKey.frequency.toString())));
                                } catch (e) {}
                              },
                              onRelease: () {
                                try {
                                  global.activeConnection.output.add(
                                      Uint8List.fromList(utf8.encode("0")));
                                  print("Key Released");
                                } catch (e) {}
                              },
                            ))
                        .toList(),
                  )),
              Container(
                  margin:
                      EdgeInsets.fromLTRB(windowSize.width * 0.0625, 0, 0, 0),
                  alignment: Alignment.topCenter,
                  height: windowSize.height * 0.65,
                  child: Row(
                      children: accidentals
                          .map((e) => PianoKey(
                                accidental: e.acc,
                                pianoKey: e.pKey.name,
                                empty: e.empty,
                                keyWidth: (windowSize.width * 1.62) /
                                    widget.keys!.length,
                                pressed: () {
                                  try {
                                    global.activeConnection.output.add(
                                        Uint8List.fromList(utf8.encode(
                                            e.pKey.frequency.toString())));
                                  } catch (e) {}
                                },
                                onRelease: () {
                                  try {
                                    global.activeConnection.output.add(
                                        Uint8List.fromList(utf8.encode("0")));
                                    print("Key Released");
                                  } catch (e) {}
                                },
                              ))
                          .toList()))
            ],
          ));
    }));
  }
}

class PianoKey extends StatefulWidget {
  @required
  String pianoKey;
  @required
  bool accidental;
  @required
  bool empty;
  Function? pressed;
  double keyWidth;
  @required
  Function? onRelease;
  PianoKey(
      {Key? key,
      this.pianoKey = "C4",
      this.accidental = false,
      this.pressed,
      this.onRelease,
      this.keyWidth = 20,
      this.empty = false});
  @override
  State<StatefulWidget> createState() {
    return _PianoKeyState();
  }
}

class _PianoKeyState extends State<PianoKey> {
  bool state = false;
  @override
  Widget build(BuildContext context) {
    switch (widget.empty) {
      case true:
        return Container(width: widget.keyWidth);
        break;
      case false:
        return InkWell(
            enableFeedback: false,
            radius: 0,
            borderRadius: const BorderRadius.vertical(
                top: Radius.zero, bottom: Radius.circular(10)),
            onTapDown: (TapDownDetails) {
              widget.pressed!();
              setState(() {
                state = true;
              });
            },
            onTapCancel: () {
              widget.onRelease!();
              setState(() {
                state = false;
              });
            },
            onTap: () {
              widget.onRelease!();
              setState(() {
                state = false;
              });
            },
            child: Container(
                width: widget.keyWidth,
                alignment: Alignment.center,
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 100),
                    width: widget.accidental
                        ? widget.keyWidth * 0.9
                        : widget.keyWidth,
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.zero, bottom: Radius.circular(10)),
                        color: widget.accidental
                            ? state
                                ? HSLColor.fromColor(Colors.black)
                                    .withLightness(0.2)
                                    .toColor()
                                : Colors.black
                            : state
                                ? HSLColor.fromColor(Colors.white)
                                    .withLightness(0.2)
                                    .toColor()
                                : Colors.white),
                    child: Text(
                      widget.pianoKey,
                      style: widget.accidental
                          ? TextStyle(
                              color: Colors.white,
                              fontSize: widget.keyWidth * 0.2)
                          : TextStyle(
                              color: Colors.black,
                              fontSize: widget.keyWidth * 0.2),
                    ))));
        break;
      default:
        return Container(width: widget.keyWidth);
        break;
    }
  }
}
