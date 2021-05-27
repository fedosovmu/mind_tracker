//import 'dart:math';
import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/scroll_simulation.dart';
// /Users/maxim/Documents/Libs/flutter/packages/flutter/lib/src/widgets/scroll_simulation.dart

class CustomSimulation implements Simulation {
  ClampingScrollSimulation _scrollSimulation;
  final double initPosition;
  final double initVelocity;
  final int itemsCount;
  final double itemSize;

  CustomSimulation({
    @required this.initPosition,
    @required this.initVelocity,
    @required this.itemsCount,
    @required this.itemSize}) {
    _scrollSimulation = ClampingScrollSimulation(
        position: initPosition,
        velocity: initVelocity
    );
  }

  int _getNearestItemIndex(double x) {
    return x ~/ itemSize;
  }

  double _getCentredItemX(double x) {
    final nearestItemIndex = _getNearestItemIndex(x);
    final loopNumber = nearestItemIndex ~/ itemsCount;
    if (loopNumber == 1) {
      return x;
    } else {
      final nearestItemX = _getNearestItemIndex(x) * itemSize;
      final shift = x - nearestItemX;
      final centerItemIndex = nearestItemIndex % itemsCount + itemsCount;
      return centerItemIndex * itemSize + shift;
    }
  }

  var _doneTime;

  @override
  double x(double time) {
    final isDone = _scrollSimulation.isDone(time);
    final x = _scrollSimulation.x(time);
    if (isDone) {
      final centerItemX = _getCentredItemX(x);
      //final nearestItemX = _getNearestItemIndex(x) * itemSize;
      return centerItemX;
    } else {
      return x;
    }
  }

  @override
  double dx(double time) {
    return _scrollSimulation.dx(time);
  }

  @override
  bool isDone(double time) {
    return _scrollSimulation.isDone(time);
  }

  @override
  set tolerance(Tolerance _tolerance) {
    _scrollSimulation.tolerance = _tolerance;
  }

  @override
  Tolerance get tolerance => _scrollSimulation.tolerance;
}