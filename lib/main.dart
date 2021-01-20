import 'dart:ffi';

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
          Container(
            color: Colors.green,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            child:  Text(
                  "Следите за своим ментальным состоянием оцкнивая его по шкале с семью градациями",
                style: TextStyle(fontSize: 16)
              ),
          ),
          Container(
            color: Colors.yellow,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            child: FlatButton (
              color: Colors.blue,
                height: 60,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                onPressed: () { print("Next button pressed"); },
                child: Text("Далее")
            )
          )
        ],
      )
    );
  }
}