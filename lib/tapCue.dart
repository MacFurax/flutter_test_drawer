import 'package:flutter/material.dart';
import 'package:test_drawer/drawer.dart';
import 'package:test_drawer/model.dart';
import 'package:test_drawer/remoteAPI.dart';

class TapCuePage extends StatelessWidget{

    void _insertCue() async
    {
      remoteApi.url = model.ip;
      remoteApi.port = model.port;
      remoteApi.insertCue();
    }

    @override
    Widget build( BuildContext context){
      return new Scaffold(
          appBar: new AppBar(
            title: new Text('Tap Cue'),
          ),
          drawer: new MyDrawer(),
          body: new Center(
            child: new MaterialButton(
              child: Text("Insert Cue",
                style: new TextStyle( fontSize: 40.0)),
              onPressed: (){
                print('Insert Cue');
                _insertCue();
              },
            ),
          ),
      );
  }

}