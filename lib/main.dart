import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.orange),
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
     drawer: new Drawer(
       child:new ListView(
         children: <Widget>[
           new Container(
             color: Colors.orange,
              child : new DrawerHeader(
                child : new Text('Erratic Master Remote',
                                  style: TextStyle(fontSize: 26.0),
                                ),
              ),
           ),
           new ListTile(
             title: new Text('Overview'),
             leading: new Icon(Icons.settings_input_antenna),
             onTap: (){
               print('Show Status page');
             },
           ),
           new ListTile(
             title: new Text('Show Control'),
             leading: new Icon(Icons.settings_input_svideo),
             onTap: (){
               print('Show Show control page');
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
     ),
     body: new Container(
       child: new Center(
         child: new Text("Home Page"),
       ),
     ),
   ) ;
  }
}