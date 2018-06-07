import 'package:flutter/material.dart';
import 'package:test_drawer/drawer.dart';

class ShowControlPage extends StatelessWidget{
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
        body: new Container(
          child: new ListView(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.all(10.0),
                child: new ListTile(
                  title: new Text('CUE 01', style: TextStyle(fontSize: 26.0),),
                  trailing: new IconButton(
                    icon: new Icon(Icons.play_circle_outline, size: 36.0, color: Colors.black,),
                    onPressed: (){},
                  ),
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