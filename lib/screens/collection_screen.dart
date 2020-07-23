import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/collectioncard.dart';
import '../providers/col_pro.dart';

class CollectionScreen extends StatelessWidget {
  final bool loading;
  CollectionScreen(this.loading);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<CollectionPoint>(context);

    final products = productData.items;
    return Scaffold(
        appBar: AppBar(
          
            iconTheme: IconThemeData(color: Colors.white),
            title: Text(
              "Live Collection Points",
              style: TextStyle(
                  color: Colors.white, fontSize: 25, fontFamily: 'Nexa'),
            )),
        body: loading
            ? Center(
                child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (BuildContext ctx, int i) {
                      return CollectionCard(
                          products[i].name,
                          products[i].status,
                          products[i].req,
                          products[i].cont);
                    }),
              )
            : Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      SizedBox(height: 80,),
                      Text(
                        'Please check your internet connection',
                        style: TextStyle(color: Colors.red),
                      )
                    ]),
              ));
  }
}
