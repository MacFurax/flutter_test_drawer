import 'package:flutter/material.dart';
import 'package:test_drawer/drawer.dart';
import 'package:test_drawer/model.dart';

class TapCuePage extends StatelessWidget{
    @override
    Widget build( BuildContext context){
      return new Scaffold(
          appBar: new AppBar(
            title: new Text('Show Control'),
            actions: <Widget>[ 
              new IconButton( 
                icon: new Icon(Icons.refresh), 
                onPressed: (){ 
                  print('Refresh list'); 
                }, 
              ), 
            ], 
          ),
          drawer: new MyDrawer(),
          body: new Center(
            child:  MaterialButton(
              child: Text("Press"),
              onPressed: (){
                print('Use IP ' + model.ip);
              },
            ),
          ),
      );
  }

}