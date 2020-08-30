import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Calculator App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Already contains a decimal.");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }
    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget BuildButton(String buttonText) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(24.0),
        onPressed: () {
          buttonPressed(buttonText);
        },
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: new Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                  child: Text(output,
                      style:
                          TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
                ),
                Expanded(child: Divider()),
                Column(
                  children: [
                    Row(
                      children: [
                        BuildButton("7"),
                        BuildButton("8"),
                        BuildButton("9"),
                        BuildButton("/"),
                      ],
                    ),
                    Row(
                      children: [
                        BuildButton("4"),
                        BuildButton("5"),
                        BuildButton("6"),
                        BuildButton("X"),
                      ],
                    ),
                    Row(
                      children: [
                        BuildButton("1"),
                        BuildButton("2"),
                        BuildButton("3"),
                        BuildButton("-"),
                      ],
                    ),
                    Row(
                      children: [
                        BuildButton("."),
                        BuildButton("0"),
                        BuildButton("00"),
                        BuildButton("+"),
                      ],
                    ),
                    Row(
                      children: [
                        BuildButton("CLEAR"),
                        BuildButton("="),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
