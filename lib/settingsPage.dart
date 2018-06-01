import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget{
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
                    initialValue: "10.0.0.127",
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
                  new MaterialButton(
                    child: new Text('Test'),
                    elevation: 2.0,
                    onPressed: (){

                    },
                  ),
                ],
              ),
            ),
        ),
        ),
    );
  }
}