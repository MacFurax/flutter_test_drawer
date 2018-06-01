import 'package:flutter/material.dart';
import 'package:test_drawer/drawer.dart';

class RideSystemPage extends StatelessWidget{
  @override
  Widget build( BuildContext context){
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Ride System'),
        ),
        drawer: new MyDrawer(),
        body: new Center(
          child: new Text('Ride System'),
        ),
    );
  }
}