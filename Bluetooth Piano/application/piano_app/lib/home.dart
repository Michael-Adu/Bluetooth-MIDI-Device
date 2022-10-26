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
          global.MusicKey("C", 262),
          global.MusicKey("C#", 277),
          global.MusicKey("D", 293),
          global.MusicKey("D#", 311),
          global.MusicKey("E", 330),
          global.MusicKey("F", 349),
          global.MusicKey("F#", 370),
          global.MusicKey("G", 392),
          global.MusicKey("G#", 415),
          global.MusicKey("A", 440),
          global.MusicKey("A#", 466),
          global.MusicKey("B ", 494),
          global.MusicKey("C ", 523)
        ],
      ),
    );
  }
}
