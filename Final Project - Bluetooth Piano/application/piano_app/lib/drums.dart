import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'global_variables.dart' as global;

class Drums extends StatefulWidget {
  @required
  List<global.MusicKey>? pads;
  Drums({this.pads, Key? key}) : super(key: key);

  @override
  _DrumsState createState() => _DrumsState();
}

class _DrumsState extends State<Drums> {
  List<global.MusicKey> _pads = List<global.MusicKey>.empty(growable: true);

  @override
  void initState() {
    super.initState();
    _pads = widget.pads!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      leading: Builder(builder: (context) {
        return IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        );
      }),
    ), body: LayoutBuilder(builder: ((context, constraints) {
      Size windowSize = Size(constraints.maxWidth, constraints.maxHeight);
      return Container(
          child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: windowSize.width * 0.0025,
        padding: EdgeInsets.all(windowSize.width * 0.01),
        crossAxisSpacing: windowSize.width * 0.01,
        mainAxisSpacing: windowSize.height * 0.05,
        children: _pads
            .map((e) => InkWell(
                onTap: () {
                  try {
                    global.activeConnection.output.add(
                        Uint8List.fromList(utf8.encode(e.name.toString())));
                  } catch (e) {}
                },
                child: Container(
                    width: windowSize.width * 0.01,
                    height: windowSize.width * 0.1,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 250, 92, 0),
                            Color.fromARGB(255, 255, 0, 234)
                          ],
                        )),
                    child: Text(e.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: windowSize.width * 0.03)))))
            .toList(),
      ));
    })));
  }
}
