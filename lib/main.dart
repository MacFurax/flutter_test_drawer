
import 'package:flutter/material.dart';
import 'package:test_drawer/drawer.dart';
import 'package:test_drawer/showControl.dart';
import 'package:test_drawer/rideSystemPage.dart';
import 'package:test_drawer/settingsPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  HomePage home = new HomePage();
  ShowControlPage showControl = new ShowControlPage();
  RideSystemPage rideSystem = new RideSystemPage();
  SettingsPage settingsPage = new SettingsPage();

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
      }
    );

  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build( BuildContext context)
  {
   return new Scaffold(
     appBar: new AppBar(
        title: new Text('Erratic Master Remote'),
        elevation: 0.0,
      ),
     drawer: new MyDrawer(),
     body: new Container(
       child: new Center(
         child: new Text("Home Page"),
       ),
     ),
   ) ;
  }
}