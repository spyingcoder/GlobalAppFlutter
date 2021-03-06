import 'package:flutter/material.dart';

class MenuBottom extends StatelessWidget {
  const MenuBottom({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/');
            break;
          case 1:
            Navigator.pushNamed(context, '/assistant');
            break;
          case 2:
            Navigator.pushNamed(context, '/bmi');
            break;
        }
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Assistant'),
        BottomNavigationBarItem(icon: Icon(Icons.monitor_weight), label: 'BMI'),
      ],
    );
  }
}
