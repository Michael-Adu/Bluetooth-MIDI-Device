import 'package:flutter/material.dart';
import "piano.dart";
import 'global_variables.dart' as global;
import "device_select.dart";

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
      drawer: Drawer(
        child: LayoutBuilder(builder: ((context, constraints) {
          Size windowSize = Size(constraints.maxWidth, constraints.maxHeight);
          return Container(
              child: Column(
            children: [
              SizedBox(
                height: windowSize.height * 0.1,
              ),
              ListTile(
                  enableFeedback: true,
                  leading: Icon(Icons.device_hub, color: Colors.white),
                  title: const Text("Select Bluetooth Device",
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DiscoveryPage()),
                    );
                  })
            ],
          ));
        })),
      ),
      body: Piano(
        keys: [
          global.MusicKey("C", 1),
          global.MusicKey("C#", 2),
          global.MusicKey("D", 3),
          global.MusicKey("D#", 4),
          global.MusicKey("E", 5),
          global.MusicKey("F", 6),
          global.MusicKey("F#", 7),
          global.MusicKey("G", 8),
          global.MusicKey("G#", 9),
          global.MusicKey("A", 10),
          global.MusicKey("A#", 11),
          global.MusicKey("B ", 12),
          global.MusicKey("C ", 13)
        ],
      ),
    );
  }
}
