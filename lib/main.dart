// @dart=2.9
import 'package:flutter/material.dart';
import 'package:getting_started_with_flutter/screens/bmi_screen.dart';
import 'package:getting_started_with_flutter/screens/voice_assistant.dart';
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
        appBarTheme: AppBarTheme(color: Colors.purple[700]),
        primarySwatch: Colors.purple,
        drawerTheme: const DrawerThemeData(backgroundColor: Colors.white,),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.purple[900],
          ),
        ),
        backgroundColor: Colors.purple,
        primaryColor: Colors.purple,
      ),
      routes: {
        '/': (context) => IntroScreen(),
        '/bmi': (context) => BmiScreen(),
        '/assistant': (context) => VoiceAssistant(),
      },
      initialRoute: '/',
    );
  }
}
