
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

  final HomePage home = new HomePage();
  final ShowControlPage showControl = new ShowControlPage();
  final RideSystemPage rideSystem = new RideSystemPage();
  final SettingsPage settingsPage = new SettingsPage();
  final TapCuePage tapCuePage = new TapCuePage();

  MyApp()
  {
    loadModel();    
  }

  void loadModel() async
  {
    await model.load();
    print('IP is ' + model.ip);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.orange,
        splashColor: Colors.orange[900],
        highlightColor: Colors.orange[200]),
      home: home,
      routes: <String, WidgetBuilder>{
        "/main":(BuildContext context)=> home,
        "/showControl":(BuildContext context)  => showControl,
        "/rideSystem":(BuildContext context)  => rideSystem,
        "/settings":(BuildContext context) => settingsPage,
        "/tapCue":(BuildContext context) => tapCuePage,
      }
    );

  }
}

