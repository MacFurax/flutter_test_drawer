import 'package:flutter/material.dart';
import 'remoteAPI.dart';

class SettingsPage extends StatefulWidget{
  SettingsPage({Key key, this.api}): super(key: key);

  final RemoteApi api;
  

  @override
  _SettingsPage createState() => new _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {

  //final RemoteApi api;
  TextEditingController IPController = new TextEditingController();
  TextEditingController PortController = new TextEditingController();

  _SettingsPage(){
    IPController.text = '127.0.0.1';
    IPController.addListener((){
      print('IP adresse modified value = ' + IPController.text);
    });
    PortController.text = '696969';
  }

  @override
  Widget build( BuildContext context){
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Settings'),
        ),
        body: new Center(
          child: new Form(
            child: new Padding(
              padding: EdgeInsets.only(
                top: 10.0, bottom: 10.0, left: 20.0, right: 20.0,
              ),
              child: new Column(
                children: <Widget>[
                  new TextFormField(
                    controller: IPController,
                    keyboardType: TextInputType.number,
                    style: new TextStyle(fontSize: 22.0, color: Colors.black),
                    decoration:  new InputDecoration(
                      labelText: 'Erratic Master IP',
                      labelStyle: new TextStyle(fontSize: 23.0),
                    ),
                  ),
                  new TextFormField(
                    controller: PortController,
                    keyboardType: TextInputType.number,
                    style: new TextStyle(fontSize: 22.0, color: Colors.black),
                    decoration:  new InputDecoration(
                      labelText: 'Erratic Master Port',
                      labelStyle: new TextStyle(fontSize: 23.0),
                    ),
                  ),
                  new Container(
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.only( top:20.0, ),
                    child: RaisedButton(
                      child: new Text('Test', style: new TextStyle( fontSize: 22.0),),
                      onPressed: (){
                        print('Test connection to server IP ' + 
                        IPController.text + 
                        ' port ' + PortController.text);
                      },
                    ),
                  ),
                ],
              ),
            ),
        ),
        ),
    );
  }
}