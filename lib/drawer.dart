import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget{
  @override
   Widget build( BuildContext context){
    return new Drawer(
       child:new ListView(
         children: <Widget>[
           new Container(
             color: Colors.orange,
              child : new DrawerHeader(
                child :new Container( 
                  alignment: Alignment.bottomLeft,
                  child : new Column( 
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('Erratic Master Remote', style: TextStyle(fontSize: 26.0)),
                      Text('Alterface-Projects', style: TextStyle(fontSize: 12.0)),
                      new IconButton(
                      icon: new Icon(Icons.settings),
                        onPressed: (){
                          Navigator.of(context).pop();
                          Navigator.of(context).pushNamed("/settings");
                          print('got to settings page');
                        }),
                    ],
                  ),
                ),
              ),
           ),
           new ListTile(
             title: new Text('Overview'),
             leading: new Icon(Icons.settings_input_antenna),
             onTap: (){
               print('Show Status page');
               Navigator.of(context).pop();
               Navigator.of(context).pushNamed("/main");
             },
           ),
           new ListTile(
             title: new Text('Show Control'),
             leading: new Icon(Icons.settings_input_svideo),
             onTap: (){
               print('Show Show control page');
               Navigator.of(context).pop();
               Navigator.of(context).pushNamed("/showControl");
             },
           ),
           new ListTile(
             title: new Text('Ride System'),
             leading: new Icon(Icons.airline_seat_recline_normal),
             onTap: (){
               print('Show Show control page');
               Navigator.of(context).pop();
               Navigator.of(context).pushNamed("/rideSystem");
             },
           ),
           new ListTile(
             title: new Text('Hide'),
             leading: new Icon(Icons.close),
             onTap: (){
               Navigator.of(context).pop();
             },
           ),
         ],
       ),
     );
  }
}