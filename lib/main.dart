import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon( Icons.settings),
            onPressed: (){
              print('Cick on settings');
            },
            ),
        ],
        backgroundColor: Colors.deepOrange,
        title: Text("Erratic Master Remote"),
      ),
      drawer: Container(
        color: Colors.orange[600],
        child:Drawer(
        child: ListView(
          children: <Widget>[
              Container(
                color: Colors.deepOrange,
                child:DrawerHeader(
                child: Column(
                  children: <Widget>[
                    Text("Erratic Master Remote", 
                    style: TextStyle(fontSize: 25.4),
                    textAlign: TextAlign.right,
                    ),
                    Text("Alterface-Projects"),
                  ],
                  ),
              ),
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
              onTap: (){
                print('Click on Cues');
              },
            ),
            ListTile(
              leading: const Icon(Icons.folder_open),
              title: const Text("Experiences"),
              onTap: (){
                print('Click on Experiences');
              },
            ),
            AboutListTile(),
          ]
        ),
      ),
      ),
    )
    );

  }
}

