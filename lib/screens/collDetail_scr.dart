import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import 'package:appathon/providers/col_pro.dart';

class CollectionDetail extends StatelessWidget {
  final String n;
  final bool stat;
  final String req;
  final int numb;
  CollectionDetail(this.n,this.stat,this.req,this.numb);


  @override
  Widget build(BuildContext context) {
    
    final productData = Provider.of<CollectionPoint>(context);
    final products = productData.items;
    var mq = MediaQuery.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Collection Point Report",
            style: TextStyle(
                color: Colors.lightGreen, fontSize: 30, fontFamily: 'Nexa'),
          ),
          SizedBox(height: 25),
          Center(
            child: Container(
              padding: EdgeInsets.all(5),
              height: mq.size.height * 0.5,
              width: mq.size.width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.lightGreen, width: 5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.home,
                      color: Colors.lightGreen,
                      size: 45,
                    ),
                    height: 80,
                    width: 75,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Location : ',style: TextStyle(color: Colors.white)),
                      Text(n,style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Status : ',style: TextStyle(color: Colors.white)),
                      Text(stat?"ACTIVE":"INACTIVE",style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Requirments : ',style: TextStyle(color: Colors.white)),
                      Text(req,style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Contact Number : ',style: TextStyle(color: Colors.white)),
                      Text(numb.toString(),style: TextStyle(color: Colors.white)),
                    ],
                  )
                ],
              ),
            ),
          ),
          RaisedButton(
              child: Text("BACK",
                  style: Theme.of(context).primaryTextTheme.bodyText1),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
