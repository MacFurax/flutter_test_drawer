import 'package:flutter/material.dart';
import 'package:test_drawer/drawer.dart';
import 'model.dart';
import 'remoteAPI.dart';


class HomePage extends StatelessWidget{
  
  
  @override
  Widget build( BuildContext context)
  {
   return new Scaffold(
     appBar: new AppBar(
        title: new Text('Erratic Master Remote'),
        //elevation: 0.0,
      ),
     drawer: new MyDrawer(),
     body: new Container(
       padding: EdgeInsets.all(10.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Text('Erratic Server Status', style: new TextStyle(fontSize: 22.0),),
                new Icon( Icons.check_circle, color: Colors.green, size: 36.0,),
              ],
            ),
            new Divider(),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Text('Ride System Status', style: new TextStyle(fontSize: 22.0),),
                new Icon( Icons.check_circle, color: Colors.green, size: 36.0,),
              ],
            ),
            new Divider(),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Text('Show Control Status', style: new TextStyle(fontSize: 22.0),),
                new Icon( Icons.check_circle, color: Colors.green, size: 36.0,),
              ],
            ),
            new Divider(),
          ],
        ),
       ),
     );
  }
}