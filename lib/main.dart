import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


import './screens/choice_scr.dart';
import './screens/emerg_scr.dart';


import './providers/location_pro.dart';
import './providers/col_pro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(
              value: SosMsg(),
            ),
            ChangeNotifierProvider.value(
              value: CollectionPoint(),
            )
          ],
          child: MaterialApp(
             debugShowCheckedModeBanner: false,
        title: 'ResQ',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          accentColor: Colors.red,
          buttonColor: Colors.lightGreen,
          fontFamily: 'Ubuntu',
          primaryTextTheme: TextTheme(
            headline1: TextStyle(fontFamily: 'Nexa',color: Colors.white70,fontSize: 22),
            bodyText1: TextStyle(fontFamily: 'Ubuntu',color: Colors.white,fontSize: 15),
          )
        ),
        home: ChoiceScreen(),
        routes: {
          ChoiceScreen().routeName : (ctx) => ChoiceScreen(),
          EmergencyScreen().routeName : (ctx) => EmergencyScreen(),
      
        },
      ),
    );
  }
}
