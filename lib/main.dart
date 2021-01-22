import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'on_boarding_page.dart';


void main() => runApp(MindTrackerApp());


class MindTrackerApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OnBoardingPage(1),
      routes: <String, WidgetBuilder>{
        'on_boarding_page/1': (BuildContext context) {
          return OnBoardingPage(1);
        },
        'on_boarding_page/2': (BuildContext contect) {
          return OnBoardingPage(2);
        },
        'on_boarding_page/3': (BuildContext context) {
          return OnBoardingPage(3);
        },
        'on_boarding_page/4': (BuildContext contect) {
          return OnBoardingPage(4);
        }
      },
    );
  }
}

