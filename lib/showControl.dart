import 'package:flutter/material.dart';
import 'package:test_drawer/drawer.dart';

class ShowControlPage extends StatelessWidget{
  @override
  Widget build( BuildContext context){
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Show Control'),
        ),
        drawer: new MyDrawer(),
        body: new Center(
          child: new Text('Show Control'),
        ),
    );
  }
}