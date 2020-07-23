
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CollectionPoint with ChangeNotifier {
  String name;
  String req;
  int cont;
  bool status;

  CollectionPoint({
    this.name,
    this.req ,
    this.status ,
    this.cont ,
  }
  );

  List<CollectionPoint> _items = [];

    List<CollectionPoint> get items {

    return [..._items];
  }

  

  Future<void> fetchCollection() async {
    const url = "https://appathon-test.firebaseio.com/cp.json";
    try {
      final res = await http.get(url);
      final extractdata = json.decode(res.body) as Map<String, dynamic>;
      final List<CollectionPoint> loadedProducts = [];
      extractdata.forEach((colID, colData) {
        loadedProducts.add(CollectionPoint(
            name: colData['Name'],
            req: colData['Req'],
            cont: colData['cont'],
            status:colData['status'],
        ));
      });
      
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
  
}