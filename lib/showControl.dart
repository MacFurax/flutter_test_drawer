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
        body: new Container(
          padding: EdgeInsets.all(16.0),
          child: new ListView(
            children: <Widget>[
              new ListTile(
                title: new Text('CUE 01', style: TextStyle(fontSize: 26.0),),
                trailing: new IconButton(
                  icon: new Icon(Icons.play_circle_outline, size: 36.0, color: Colors.black,),
                  onPressed: (){},
                ),
              ),
              new ListTile(
                title: new Text('CUE 02', style: TextStyle(fontSize: 26.0),),
                trailing: new IconButton(
                  icon: new Icon(Icons.play_circle_outline, size: 36.0,color: Colors.black,),
                  onPressed: (){},
                ),
              ),
              new ListTile(
                title: new Text('CUE 03', style: TextStyle(fontSize: 26.0),),
                trailing: new IconButton(
                  icon: new Icon(Icons.play_circle_outline, size: 36.0,color: Colors.black,),
                  onPressed: (){},
                ),
              ),
              new ListTile(
                title: new Text('CUE 04', style: TextStyle(fontSize: 26.0),),
                trailing: new IconButton(
                  icon: new Icon(Icons.play_circle_outline, size: 36.0,color: Colors.black,),
                  onPressed: (){},
                ),
              ),
              new ListTile(
                title: new Text('CUE 05', style: TextStyle(fontSize: 26.0),),
                trailing: new IconButton(
                  icon: new Icon(Icons.play_circle_outline, size: 36.0,color: Colors.black,),
                  onPressed: (){},
                ),
              ),
              new ListTile(
                title: new Text('CUE 06', style: TextStyle(fontSize: 26.0),),
                trailing: new IconButton(
                  icon: new Icon(Icons.play_circle_outline, size: 36.0,color: Colors.black,),
                  onPressed: (){},
                ),
              ),
            ],
          ),
        ),
    );
  }
}