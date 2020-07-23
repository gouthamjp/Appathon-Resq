import 'package:appathon/providers/location_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';

class EmergencyScreen extends StatefulWidget {
  final String routeName = '/emergency-page';
  @override
  _EmergencyScreenState createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  double long;
  double lat;
  Position _currentPosition;

  final _nameController = TextEditingController();

  final _numberController = TextEditingController();

      final List<String> _currencies = ["Medical", "Rescue", "Supply Shortage"];
    String _currentSelectedValue;

  @override
  Widget build(BuildContext context) {

    final detData = Provider.of<SosMsg>(context);
    _getCurrentLocation() async {
      final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

      geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
          .then((Position position) {
        setState(() {
          _currentPosition = position;
        });
      }).catchError((e) {
        print(e);
      });
    }

    
    void _inforsending() { 
      detData.setSos(_nameController.text, _numberController.text, _currentSelectedValue,_currentPosition.longitude, _currentPosition.latitude);
      Navigator.pop(context);
    }
    return Scaffold(
      body: Center(
        child: Column(children: <Widget>[
          SizedBox(height: 70),
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              'Send  SOS  Alert!',
              style: TextStyle(
                  color: Colors.lightGreen, fontSize: 35, fontFamily: 'Nexa'),
            ),
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(10),
              width: 300,
              child: TextField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(15),
                  ],
                  controller: _nameController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlue, width: 1.3),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightGreen, width: 1.3),
                    ),
                    hintText: 'Name',
                  )),
            ),
          ),
          Flexible(
              child: Container(
            padding: EdgeInsets.all(10),
            width: 300,
            child: TextField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(10),
              ],
              controller: _numberController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue, width: 1.3),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightGreen, width: 1.3),
                ),
                hintText: 'Contact Number',
              ),
              keyboardType: TextInputType.number,
            ),
          )),
          Flexible(
            child: Container(
              width: 300,
              padding: EdgeInsets.all(10),
              child: FormField<String>(
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.lightBlue, width: 1.3),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.lightGreen, width: 1.3),
                        ),
                        hintText: 'Emergency Type',
                        helperText: '* Emergency Type'),
                    isEmpty: _currentSelectedValue == null,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _currentSelectedValue,
                        isDense: true,
                        onChanged: (String newValue) {
                          setState(() {
                            _currentSelectedValue = newValue;
                            state.didChange(newValue);
                          });
                        },
                        items: _currencies.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(6),
            child: Column(
              children: <Widget>[
                OutlineButton(
                  child: Text(
                    'Fetch My Location',
                    style: TextStyle(
                        fontFamily: 'Ubuntu',
                        color: Colors.lightGreen,
                        fontSize: 15),
                  ),
                  color: Colors.white,
                  highlightedBorderColor: Colors.lightGreen,
                  onPressed: _getCurrentLocation,
                ),
                Text(
                  '* please switch on your location services',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 9,
                  ),
                )
              ],
            ),
          ),
          RaisedButton(
            padding: EdgeInsets.all(10),
            child: Text(
              "Send",
              style: Theme.of(context).primaryTextTheme.bodyText1,
            ),
            onPressed: _inforsending,
          )
        ]),
      ),
    );
    
  }
}
