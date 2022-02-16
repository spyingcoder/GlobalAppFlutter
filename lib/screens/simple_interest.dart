import 'package:flutter/material.dart';
import 'package:getting_started_with_flutter/shared/menu_drawer.dart';

class SICal extends StatefulWidget {
  const SICal({Key key}) : super(key: key);

  @override
  _SICalState createState() => _SICalState();
}

class _SICalState extends State<SICal> {
  final minPadding = 10.0;
  var _currencies = ['Rupees', 'Dollars', 'Pounds'];
  var _defaultValue = 'Rupees';

  @override
  Widget build(BuildContext context) {
    var dHeight = MediaQuery.of(context).size.height;
    // var dwidth = MediaQuery.of(context).size.width;
    // var fixedHeight = dHeight * 0.5;
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        actions: [
          Icon(
            Icons.refresh,
            size: minPadding * 3,
            semanticLabel: "Refresh",
          ),
        ],
        iconTheme: IconThemeData(color: Colors.blue[300]),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      drawer: const MenuDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //
            const Image(
              image: AssetImage("assets/si_logo.png"),
            ),
            SizedBox(
              height: dHeight * 0.05,
            ),
            //
            Padding(
              padding: EdgeInsets.all(minPadding),
              // height: fixedHeight,
              child: TextFormField(
                keyboardType: TextInputType.number,
                // controller: ,
                decoration: InputDecoration(
                  labelText: "Principle(In your currency)",
                  hintText: "Enter Principle amount, e.g., 12000",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(minPadding)),
                ),
              ),
            ),
            //
            Padding(
              padding: EdgeInsets.all(minPadding),
              // height: fixedHeight,
              child: TextFormField(
                keyboardType: TextInputType.number,
                // controller: ,
                decoration: InputDecoration(
                  labelText: "Rate of Interest(%)",
                  hintText: "In Percentage",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(minPadding)),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    // height: fixedHeight,
                    padding: EdgeInsets.all(minPadding),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      // controller: ,
                      decoration: InputDecoration(
                        labelText: "Time(Year)",
                        hintText: "Time",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(minPadding)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: DropdownButton<String>(
                    items: _currencies.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: (String newValueSelected) {
                      _onDropDownSelect(newValueSelected);
                    },
                    value: _defaultValue, 
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onDropDownSelect(String newValueSelected) {
    setState(() {
      _defaultValue = newValueSelected;
    });
  }
}
