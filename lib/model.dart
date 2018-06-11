
library model;

import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

Model model = new Model();


class Model
{
  String ip;
  String port;

  bool loaded = false;

  SharedPreferences  storage;

  Future<void> load() async
  {
    storage = await SharedPreferences.getInstance();
    ip = storage.getString('ErraticMasterIP');
    if( ip == null)
    {
      ip = '127.0.0.1';
      await storage.setString('ErraticMasterIP', '127.0.0.1');
    }

    port = storage.getString('ErraticMasterPort');
    if( port == null)
    {
      port = '6969';
      await storage.setString('ErraticMasterPort', '6969');
    }
    loaded = true;
  }

  void save() async 
  {
    await storage.setString('ErraticMasterIP', '127.0.0.1');
    await storage.setString('ErraticMasterPort', '6969');

  }
}