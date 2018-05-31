import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: Text("Erratic Master Remote"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text("Erratic Master Remote"),
            ),
            ListTile(
              leading: const Icon(Icons.folder_open),
              title: const Text('Status'),
              onTap: (){
                print('Click on Status');
              }
            ),
            ListTile(
              leading: const Icon(Icons.folder_open),
              title: const Text("Cues"),
            ),
            ListTile(
              leading: const Icon(Icons.folder_open),
              title: const Text("Experiences"),
            ),
            AboutListTile(),
          ]
        ),
      ),
    )
    );

  }
}

