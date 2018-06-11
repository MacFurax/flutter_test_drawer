
import 'package:flutter/material.dart';
import 'package:test_drawer/showControl.dart';
import 'package:test_drawer/rideSystemPage.dart';
import 'package:test_drawer/settingsPage.dart';
import 'package:test_drawer/homePage.dart';
import 'package:test_drawer/remoteAPI.dart';
import 'package:test_drawer/tapCue.dart';
import 'package:test_drawer/model.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  MyApp()
  {
        
  }

  void loadModel() async
  {
    await model.load();
    print('IP is ' + model.ip);
    print('Port is ' + model.port);
  }

  @override
  Widget build(BuildContext context) {
    loadModel();
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.orange,
        splashColor: Colors.orange[900],
        highlightColor: Colors.orange[200]),
      home: new HomePage(),
      routes: <String, WidgetBuilder>{
        "/main":(BuildContext context)=> new HomePage(),
        "/showControl":(BuildContext context)  => new ShowControlPage(),
        "/rideSystem":(BuildContext context)  => new RideSystemPage(),
        "/settings":(BuildContext context) => new SettingsPage(),
        "/tapCue":(BuildContext context) => new TapCuePage(),
      }
    );

  }
}

