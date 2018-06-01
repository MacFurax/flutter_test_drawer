import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.orange),
      home: new HomePage(),
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
   ) ;
  }
}