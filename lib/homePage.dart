import 'package:flutter/material.dart';
import 'package:test_drawer/drawer.dart';

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
          child: new Text('Erratic Master Status Overview'),
        ),
       ),
     );
  }
}