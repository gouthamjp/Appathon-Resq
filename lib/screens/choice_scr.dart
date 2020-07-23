import 'package:flutter/material.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import '../providers/col_pro.dart';
import './collection_screen.dart';

class ChoiceScreen extends StatefulWidget {
    final String routeName = '/choice';
  @override
  _ChoiceScreenState createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {


   bool _loading = false;

  @override
  Widget build(BuildContext context) {
    void _test() {
      Navigator.pushNamed(context, '/emergency-page');
    }

    void _test2() async{
      Provider.of<CollectionPoint>(context, listen: false).fetchCollection();
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          _loading = true;
        }
      } on SocketException catch (_) {
        _loading = false;
      }
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CollectionScreen(_loading),
          ));
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ResQ',
              style: TextStyle(
                  color: Colors.lightGreen, fontSize: 70, fontFamily: 'Nexa'),
            ),
            SizedBox(
              height: 40,
            ),
            Image.asset(
              'assets/images/emergency.png',
              height: 200,
              width: 200,
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              child: Text(
                'View Collection Point',
                style: Theme.of(context).primaryTextTheme.bodyText1,
              ),
              color: Theme.of(context).buttonColor,
              onPressed: _test2,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'In case of emergency please press the red button below !',
              style: TextStyle(
                  fontFamily: 'Ubuntu', color: Colors.red[300], fontSize: 10),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.warning),
        onPressed: _test,
        backgroundColor: Theme.of(context).accentColor,
      ),
    );
  }
}
