import 'package:flutter/material.dart';
import 'package:test_drawer/remoteAPI.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget{
  //SettingsPage( {Key key }): super(key: key);

  
  @override
  _SettingsPage createState() => new _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {

  //final RemoteApi api;
  var prefs;
  Widget content;
  TextEditingController IPController = new TextEditingController();
  TextEditingController PortController = new TextEditingController();

  _SettingsPage(){
    content = new Text("Loading data...");

    _getData();
  
  }


  String _testConnectionStatus = 'Not yet Tested';
  RemoteApi api;

  void _getData() async
  {
    prefs = await SharedPreferences.getInstance();

    var strIP = prefs.getString('ErraticMasterIP');
    if( strIP == null)
    {
      IPController.text = '127.0.0.1';
      await prefs.setString('ErraticMasterIP', '127.0.0.1');
    }

    var strPort = prefs.getString('ErraticMasterPort');
    if( strPort == null)
    {
      PortController.text = '6969';
      await prefs.setString('ErraticMasterPort', '6969');
    }
    setState((){
      content = new Text("Data loaded");
    });
    
  }

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
                  new Container(
                    padding: EdgeInsets.all(10.0),
                    child :content,
                  ),
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
                    child: new Row(
                      children: <Widget>[
                        RaisedButton(
                          child: new Text('Test', style: new TextStyle( fontSize: 22.0),),
                          onPressed: (){
                            _requestStatus();
                            print('Test connection to server IP '+
                            IPController.text + 
                            ' port ' + PortController.text);
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