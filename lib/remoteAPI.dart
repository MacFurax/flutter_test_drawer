library remote_api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

final remoteApi = new RemoteApi._private();

class Status{
  final bool erraticMasterStatus;
  final bool showControlStatus;
  final bool rideSystemStatus;

  Status({this.erraticMasterStatus, this.rideSystemStatus, this.showControlStatus});

  factory Status.fromJson( Map<String, dynamic> json )
  {
    return new Status(
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
  final HttpClient httpClient = HttpClient();
  final url = '127.0.0.1:6969';

  RemoteApi._private();

  Future<String> getStatus() async {
    
    final uri = Uri.http(url,"/status");
    
    final httpRequest = await httpClient.getUrl(uri);
    final httpResponse = await httpRequest.close();

    if( httpResponse.statusCode != HttpStatus.OK){
      return null;
    }

    final responseBody = httpResponse.transform(utf8.decoder).join();

    return responseBody;
  }

  Future<bool> testService() async
  {
    final uri = Uri.http(url,"/test");
    
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
    
    final uri = Uri.http(url,"/showControl/cues");
    
    final httpRequest = await httpClient.getUrl(uri);
    final httpResponse = await httpRequest.close();

    if( httpResponse.statusCode != HttpStatus.OK){
      return null;
    }

    final responseBody = await httpResponse.transform(utf8.decoder).join();

    return parseCues(responseBody);
  }

}