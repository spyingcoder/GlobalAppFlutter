import 'package:flutter/material.dart';
import 'package:getting_started_with_flutter/screens/sessions_screen.dart';
import 'package:getting_started_with_flutter/screens/weather_screen.dart';
import '../screens/intro_screen.dart';
import '../screens/bmi_screen.dart';
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
      'Weather',
      'Training',
      'Know More about BMI'
    ];
    List<Widget> menuItems = [];
    menuItems.add(
      DrawerHeader(
        decoration: BoxDecoration(color: Colors.purple[900]),
        child: Text(
          'Global App',
          style: TextStyle(
            color: Colors.cyan[700],
            fontSize: 28,
          ),
        ),
      ),
    );
    menuTiles.forEach((String element) {
      Widget screen = Container();
      menuItems.add(ListTile(
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
              case 'Weather':
                screen = WeatherScreen();
                break;
              case 'Training':
                screen = SessionsScreen();
                break;
              case 'Know More about BMI':
              launch(_url);
            }
            Navigator.of(context).pop();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => screen));
          }));
    });
    return menuItems;
  }
}
