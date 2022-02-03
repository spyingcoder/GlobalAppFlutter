import 'package:flutter/material.dart';
import 'package:getting_started_with_flutter/screens/sessions_screen.dart';
import 'package:getting_started_with_flutter/screens/voice_assistant.dart';
import 'package:getting_started_with_flutter/screens/weather_screen.dart';
import '../screens/intro_screen.dart';
import '../screens/bmi_screen.dart';
import '../screens/currency_conversion.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key key}) : super(key: key);
  final String _url = 'https://en.wikipedia.org/wiki/Body_mass_index';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTiles = [
      'Home',
      'BMI Calculator',
      'Know More about BMI',
      'Weather',
      'Training',
      'Currency Convertor',
      'Voice Assistant'
    ];
    List<Widget> menuItems = [];
    menuItems.add(
      DrawerHeader(
        decoration: BoxDecoration(color: Colors.blue),
        child: Text(
          'Global App', 
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
        ),
      ),
    );
    menuTiles.forEach(
      (String element) {
        Widget screen = Container();
        menuItems.add(
          ListTile(
            title: Text(
              element,
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              switch (element) {
                case 'Home':
                  screen = IntroScreen();
                  break;
                case 'BMI Calculator':
                  screen = BmiScreen();
                  break;
                case 'Know More about BMI':
                  launch(_url);
                  break;
                case 'Weather':
                  screen = WeatherScreen();
                  break;
                case 'Training':
                  screen = SessionsScreen();
                  break;
                case 'Currency Convertor':
                  screen = CurrencyConversion();
                  break;
                case 'Voice Assistant':
                  screen = VoiceAssistant();
                  break;
              }
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => screen),
              );
            },
          ),
        );
      },
    );
    return menuItems;
  }
}
