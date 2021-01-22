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
      initialRoute: 'on_boarding_page/1',
      routes: {
        'on_boarding_page/1': (context) => OnBoardingPage(1),
        'on_boarding_page/2': (context) => OnBoardingPage(2),
        'on_boarding_page/3': (context) => OnBoardingPage(3),
        'on_boarding_page/4': (context) => OnBoardingPage(4),
      }
    );
  }
}

