import 'dart:math';

import 'package:flutter/material.dart';


class CustomSimulation extends Simulation {
  final double initPosition;
  final double initVelocity;
  final int itemsCount;
  final double itemSize;

  CustomSimulation({@required this.initPosition, @required this.initVelocity,
    @required this.itemsCount, @required this.itemSize}) {
    print('Start simulation:');
    print('initPosition: $initPosition initVelocity: $initVelocity');
  }

  double _duration = 3;

  @override
  double x(double time) {
    if (time == 0) {
      return initPosition;
    }
    _duration = initVelocity.abs() / (600 * 5);
    final normalizedTime = min(1.0, time / _duration);
    final deltaForAllTime = initVelocity * _duration;
    //final curve = Curves.easeOutCubic;
    //final curve = Curves.bounceOut;
    final curve = Curves.easeOutCirc;
    final delta = deltaForAllTime * curve.transform(normalizedTime);
    final x = initPosition + delta;
    //print('x: $x time: $time');
    return x;
    //Curves.ease.transform(t); I can use this
  }

  @override
  double dx(double time) {
    if (time >= _duration) {
      return 0;
    }
    return initVelocity;
  }

  @override
  bool isDone(double time) {
    return time > 5;
  }
}