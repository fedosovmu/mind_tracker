import 'package:flutter/material.dart';


class CustomSimulation extends Simulation {
  final double initPosition;
  final double initVelocity;
  final int itemsCount;
  final double itemHeight;

  CustomSimulation({@required this.initPosition, @required this.initVelocity,
    @required this.itemsCount, @required this.itemHeight});

  @override
  double x(double time) {
    final x = initPosition + initVelocity * time;
    print('x: $x, time: $time');
    return x;
    //Curves.ease.transform(t); I can use this
  }

  @override
  double dx(double time) {
    print('velocity: $initVelocity');
    return initVelocity;
  }

  @override
  bool isDone(double time) {
    return time > 5;
  }
}