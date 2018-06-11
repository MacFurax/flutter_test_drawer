import 'package:flutter/material.dart';
import 'package:test_drawer/remoteAPI.dart';
import 'package:test_drawer/model.dart';

class SettingsPage extends StatefulWidget{
  
  @override
  _SettingsPage createState() => new _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {

  //final RemoteApi api;
  Widget content;
  final TextEditingController ipController = new TextEditingController();
  final TextEditingController portController = new TextEditingController();
  
  @override
  void initState()
  {
    super.initState();

    ipController.addListener( _updateIp );
    portController.addListener( _updatePort );

  }

  @override
  void dispose()
  {
    ipController.removeListener(_updateIp );
    portController.removeListener(_updatePort);

    ipController.dispose();
    portController.dispose();

    super.dispose();
  }

  

  _SettingsPage(){
    content = new Text("Loading data...");
    _getData();
  }

  String _testConnectionStatus = 'Not yet Tested';

  void _updateIp()
  {
    model.ip = ipController.text;
    model.save();
  }

  void _updatePort()
  {
    model.port = portController.text;
    model.save();
  }

  void _getData()
  {
    ipController.text = model.ip;
    portController.text = model.port;
  
    content = new Text("Data loaded");
  }

  void _requestStatus() async {
    setState((){
      _testConnectionStatus = 'Trying to connect to Erratic Master...';
    });
    try {
      //var api = new RemoteApi();
      
      remoteApi.url = model.ip;
      remoteApi.port = model.port;

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
                    controller: ipController,
                    keyboardType: TextInputType.number,
                    style: new TextStyle(fontSize: 22.0, color: Colors.black),
                    decoration:  new InputDecoration(
                      labelText: 'Erratic Master IP',
                      labelStyle: new TextStyle(fontSize: 23.0),
                    ),
                  ),
                  new TextFormField(
                    controller: portController,
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
                            ipController.text + 
                            ' port ' + portController.text);
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