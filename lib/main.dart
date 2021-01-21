import 'dart:ffi';

import 'package:flutter/material.dart';
import 'on_boarding_page.dart';


void main() => runApp(MindTrackerApp());


class MindTrackerApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OnBoardingPage(),
    );
  }
}

