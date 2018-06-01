
import 'package:flutter/material.dart';
import 'drawer.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.orange,
        splashColor: Colors.orange[900],
        highlightColor: Colors.orange[200]),
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
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.settings),
            onPressed: (){
              print('got to settings page');
            },
          ),
        ],
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