import 'package:flutter/material.dart';
import 'package:getting_started_with_flutter/shared/menu_drawer.dart';
import '../shared/menu_bottom.dart';

// import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  final healthyBmiRange = SnackBar(
    content: const Text("Healthy BMI range: 18.5 kg/m² to 25 kg/m²"),
    action: SnackBarAction(
      label: "Close",
      onPressed: () {},
    ),
    duration: const Duration(days: 365),
  );

  final emptyValue = SnackBar(
    content: const Text("You can't let the fields empty !"),
    action: SnackBarAction(
      label: "Close",
      onPressed: () {},
    ),
    duration: Duration(days: 365),
  );

  double _result = 0.0;
  bool valueFilled = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[900],
      bottomNavigationBar: MenuBottom(),
      appBar: AppBar(
        elevation: 0,
        title: Container(
          margin: const EdgeInsets.only(left: 30),
          child: const Text(
            "Calculate Your BMI Here",
          ),
        ),
        actions: [
          IconButton(
            onPressed: clearText,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      drawer: const MenuDrawer(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              width: screenWidth,
              height: screenHeight,
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        width: 300,
                        margin: const EdgeInsets.only(top: 150.0),
                        padding: const EdgeInsets.all(3),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: _weightController, //variable value
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            filled: true,
                            labelText: "Enter Your Weight (in kg)",
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                        ),
                      ),
                      Container(
                        width: 300,
                        padding: const EdgeInsets.only(top: 3),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: _heightController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            filled: true,
                            labelText: "Enter Your Height (in cm)",
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(30),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_heightController.text == "" ||
                            _weightController.text == "") {
                          emptyValue;
                          ScaffoldMessenger.of(context)
                              .showSnackBar(emptyValue);
                        } else {
                          calBMI();
                        }
                      },
                      child: const Text(
                        "Calculate",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: Colors.red, width: 1),
                        elevation: 5,
                        shadowColor: Colors.red,
                        primary: const Color.fromARGB(
                            255, 16, 255, 8), //background color of button
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: screenWidth - 100,
                    height: 60,
                    padding: const EdgeInsets.all(10),
                    // margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      (valueFilled == false
                          ? resultArea()
                          : "Your BMI is " +
                              _result.toStringAsFixed(2) +
                              " kg/m².\nYou are " +
                              ((_result > 18.5 && _result < 24.9)
                                  ? "totally fit according to your BMI."
                                  : "not fit according to your BMI.")),
                      style: const TextStyle(
                          color: Colors.yellow,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                      onPressed: () {
                        healthyBmiRange;
                        ScaffoldMessenger.of(context)
                            .showSnackBar(healthyBmiRange);
                      },
                      child: const Text("What is Healthy BMI Range?"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void calBMI() {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);

    double heightSquare = height * height;
    double result = weight / heightSquare;
    setState(() {
      _result = result;
      valueFilled = true;
    });
  }

  void clearText() {
    _heightController.clear();
    _weightController.clear();
    valueFilled = false;
    setState(() {
      resultArea;
    });
  }

  String resultArea() {
    return valueFilled == false ? ("Result Will Appear here") : "";
  }
}
