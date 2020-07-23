import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Sos {
  String name;
  String number;
  String eType;
  double longitude;
  double latitude;

  Sos({
    @required this.name,
    @required this.number,
    @required this.eType,
    @required this.longitude,
    @required this.latitude,
  });
}

class SosMsg with ChangeNotifier {
  var push = Sos(
      name: null, number: null, eType: null, longitude: null, latitude: null);

  void setBase(String one, String two, String three) {
    push.name = one;
    push.number = two;
    push.eType = three;
  }

  void setLocation(double long, double lat) {
    push.longitude = long;
    push.latitude = lat;
  }

  void setSos(
      String one, String two, String three, double long, double lat)  {
    setBase(one, two, three);
    setLocation(long, lat);
   const url = 'https://appathon-sos.firebaseio.com/sosmsg.json';

    http.post(
      url,
      body: json.encode({
        'Name': push.name,
        'Contact': push.number,
        'Etype': push.eType,
        'longitude': push.longitude,
        'latitude': push.latitude,
      }),
    );
    
  }
}
