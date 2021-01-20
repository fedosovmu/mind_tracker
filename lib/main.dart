import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        children: [
          Container(
            color: Colors.red,
            width: 360,
            height: 270,
          ),
          Center(
            child: Text(
              "Следите за своим ментальным состоянием оцкнивая его по шкале с семью градациями"
            ),
          ),
          FlatButton(
              onPressed: () { print("Next button pressed"); },
              child: Text("Далее")
          )
        ],
      )
    );
  }
}