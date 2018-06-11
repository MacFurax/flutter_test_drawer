library remote_api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

final RemoteApi remoteApi = new RemoteApi._private();

class ErraticMasterStatus{
  final bool erraticMasterStatus;
  final bool showControlStatus;
  final bool rideSystemStatus;

  ErraticMasterStatus({this.erraticMasterStatus, this.rideSystemStatus, this.showControlStatus});

  factory ErraticMasterStatus.fromJson( Map<String, dynamic> json )
  {
    return new ErraticMasterStatus(
      erraticMasterStatus: json['erraticMasterStatus'],
      showControlStatus: json['showControlStatus'],
      rideSystemStatus: json['rideSystemStatus'],
    );
  }
}

class Cue{
  final int id;
  final String name;
  final double duration;

  Cue ({this.id, this.name, this.duration});

  factory Cue.fromJson( Map<String, dynamic> json)
  {
    return new Cue( 
      id: json['id'],
      name : json['name'],
      duration : json['duration'],
    );
  }
}

class RemoteApi{
  HttpClient httpClient = HttpClient();
  String url = '127.0.0.1';
  String port = '6969';

  RemoteApi._private();

  Future<ErraticMasterStatus> getStatus() async {
    
    final uri = Uri.http(url+':'+port,"/status");
    
    final httpRequest = await httpClient.getUrl(uri);
    final httpResponse = await httpRequest.close();

    if( httpResponse.statusCode != HttpStatus.OK){
      return null;
    }

    final responseBody = await httpResponse.transform(utf8.decoder).join();
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return ErraticMasterStatus.fromJson( parsed );
  }

  Future<bool> testService() async
  {
    final uri = Uri.http(url+':'+port,"/test");
    
    final httpRequest = await httpClient.getUrl(uri);
    final httpResponse = await httpRequest.close();

    if( httpResponse.statusCode != HttpStatus.OK){
      return null;
    }

    String responseBody = await httpResponse.transform(utf8.decoder).join();

    return ( responseBody == 'ErraticMaster:OK');
  }

  List<Cue> parseCues(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Cue>( (json) => new Cue.fromJson(json)).toList();
  }

  Future<List<Cue>> fetchShowControlCues() async {
    
    final uri = Uri.http(url+':'+port,"/showControl/cues");
    
    final httpRequest = await httpClient.getUrl(uri);
    final httpResponse = await httpRequest.close();

    if( httpResponse.statusCode != HttpStatus.OK){
      return null;
    }

    final responseBody = await httpResponse.transform(utf8.decoder).join();

    return parseCues(responseBody);
  }

  void insertCue() async {

    final uri = Uri.http(url+':'+port,"/showControl/insertCue");

    final httpRequest = await httpClient.getUrl(uri);
    final httpResponse = await httpRequest.close();     
  
  }

}