// @dart=2.9
import 'package:flutter/material.dart';
import 'package:getting_started_with_flutter/screens/bmi_screen.dart';
import 'screens/intro_screen.dart';

void main() {
  runApp(GlobeApp());
}

class GlobeApp extends StatelessWidget {
  const GlobeApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.blueGrey[900]),
        primarySwatch: Colors.blueGrey,
        drawerTheme: DrawerThemeData(
          backgroundColor: Colors.blueGrey,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.blueGrey[900],
          ),
        ),
        backgroundColor: Colors.blueGrey,
        primaryColor: Colors.blueGrey,
        
      ),
      routes: {
        '/': (context) => IntroScreen(),
        '/bmi': (context) => BmiScreen(),
      },
      initialRoute: '/',
    );
  }
}
