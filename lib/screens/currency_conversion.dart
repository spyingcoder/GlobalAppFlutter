import 'package:flutter/material.dart';
import 'package:getting_started_with_flutter/shared/menu_bottom.dart';
import 'package:getting_started_with_flutter/shared/menu_drawer.dart';

class CurrencyConversion extends StatefulWidget {
  const CurrencyConversion({Key key}) : super(key: key);

  @override
  _CurrencyConversionState createState() => _CurrencyConversionState();
}

class _CurrencyConversionState extends State<CurrencyConversion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MenuBottom(),
      drawer: MenuDrawer(),
      appBar: AppBar(
        title: Text("Currency Convertor"),
      ),
    );
  }
}
