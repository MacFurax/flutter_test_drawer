import 'package:flutter/material.dart';
import 'package:test_drawer/remoteAPI.dart';

class SettingsPage extends StatefulWidget{
  SettingsPage(RemoteApi  remApi, {Key key }): super(key: key);

 

  @override
  _SettingsPage createState() => new _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {

  String _testConnectionStatus = 'Not yet Tested';
   RemoteApi api;



  void _requestStatus() async {
    setState((){
      _testConnectionStatus = 'Trying to connect to Erratic Master...';
    });
    try {
      //var api = new RemoteApi();
      
      bool ret = await remoteApi.testService();

      setState(() {
        if( ret  ){
          _testConnectionStatus = 'Yeah Erratic Master replies !';
        }else{
          _testConnectionStatus = 'This is not Erratic Master !';
        }
      });

    }on Exception catch( e ){
       print('Error: $e');
       setState((){
        _testConnectionStatus = 'Connection error !';
      });
    }
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
                    keyboardType: TextInputType.number,
                    style: new TextStyle(fontSize: 22.0, color: Colors.black),
                    decoration:  new InputDecoration(
                      labelText: 'Erratic Master IP',
                      labelStyle: new TextStyle(fontSize: 23.0),
                    ),
                    initialValue: "127.0.0.1",
                  ),
                  new TextFormField(
                    keyboardType: TextInputType.number,
                    style: new TextStyle(fontSize: 22.0, color: Colors.black),
                    decoration:  new InputDecoration(
                      labelText: 'Erratic Master Port',
                      labelStyle: new TextStyle(fontSize: 23.0),
                    ),
                    initialValue: "44669",
                  ),
                  new Container(
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.only( top:20.0, ),
                    child: new Row(
                      children: <Widget>[
                        RaisedButton(
                          child: new Text('Test', style: new TextStyle( fontSize: 22.0),),
                          onPressed: (){
                            _requestStatus();
                            //print('Test connection to server');
                          },
                        ),
                        new Container(
                          padding: EdgeInsets.only( left:20.0, ),
                          child: new Text("$_testConnectionStatus"),
                        ),
                      ], 
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