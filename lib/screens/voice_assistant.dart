import 'package:flutter/material.dart';
import 'package:getting_started_with_flutter/shared/menu_drawer.dart';
// import 'package:getting_started_with_flutter/shared/menu_bottom.dart';

class VoiceAssistant extends StatefulWidget {
  const VoiceAssistant({Key key}) : super(key: key);

  @override
  _VoiceAssistantState createState() => _VoiceAssistantState();
}

class _VoiceAssistantState extends State<VoiceAssistant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MenuDrawer(),
      body: Column(
        children: <Widget>[],
      ),
      // bottomNavigationBar: MenuBottom(),
    );
  }
}
