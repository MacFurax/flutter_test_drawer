import 'package:flutter/material.dart';
import 'package:test_drawer/drawer.dart';
import 'package:test_drawer/model.dart';
import 'package:test_drawer/remoteAPI.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => new _HomePage();
}

class _HomePage extends State<HomePage>{
  

  Icon iconErraticMaster = new Icon( Icons.help, color: Colors.grey, size: 36.0);
  Icon iconShowControl = new Icon( Icons.help, color: Colors.grey, size: 36.0);
  Icon iconRideSystem = new Icon( Icons.help, color: Colors.grey, size: 36.0);

  _HomePage(){
    //_loadStatus();
    print('_HomePage');
  }

  void _loadStatus() async
  {
    setState(() {
      iconErraticMaster = new Icon( Icons.help, color: Colors.grey, size: 36.0);
      iconShowControl = new Icon( Icons.help, color: Colors.grey, size: 36.0);
      iconRideSystem = new Icon( Icons.help, color: Colors.grey, size: 36.0);
    });

    remoteApi.url = model.ip;
    remoteApi.port = model.port;

    ErraticMasterStatus status = await remoteApi.getStatus();

    setState(() {
      if( status.erraticMasterStatus)
      {
        iconErraticMaster = new Icon( Icons.check_circle, color: Colors.green, size: 36.0);
      }else{
        iconErraticMaster = new Icon( Icons.clear, color: Colors.red, size: 36.0);
      }      
    });
    
  }

  @override
  Widget build( BuildContext context)
  {
   return new Scaffold(
     appBar: new AppBar(
        title: new Text('Erratic Master Remote'),
        //elevation: 0.0,
        actions: <Widget>[
          new IconButton( 
            icon: new Icon(Icons.refresh),
            onPressed: (){
              _loadStatus();
            },
          ),
        ],
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
                iconErraticMaster,
              ],
            ),
            new Divider(),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Text('Ride System Status', style: new TextStyle(fontSize: 22.0),),
                iconRideSystem,
              ],
            ),
            new Divider(),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Text('Show Control Status', style: new TextStyle(fontSize: 22.0),),
                iconShowControl,
              ],
            ),
            new Divider(),
          ],
        ),
       ),
     );
  }
}