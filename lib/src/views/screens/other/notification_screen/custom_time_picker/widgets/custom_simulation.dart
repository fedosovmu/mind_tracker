//import 'dart:math';
import 'dart:math';

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

  int get _topLoopsCount => 100 ~/ itemsCount;
  int get _topItemsCount => _topLoopsCount * itemsCount;

  double _getCentredItemX(double x) {
    final nearestItemIndex = _getNearestItemIndex(x);
    final loopIndex = nearestItemIndex ~/ itemsCount;
    if (loopIndex == _topLoopsCount) {
      return x;
    } else {
      final nextItemX = _getNearestItemIndex(x) * itemSize;
      final shiftToNextItem = x - nextItemX;
      final centerItemIndex = nearestItemIndex % itemsCount + _topItemsCount;
      return centerItemIndex * itemSize + shiftToNextItem;
    }
  }

  static const _magneticSimulationDuration = 0.5;

  @override
  double x(double time) {
    final isDone = _scrollSimulation.isDone(time);
    final x = _scrollSimulation.x(time);
    if (isDone) {
      final timeSinceDone = time - _getClampingScrollSimulationDuration();
      final animation = min(timeSinceDone, _magneticSimulationDuration) / _magneticSimulationDuration;
      final centerItemX = _getCentredItemX(x);
      final nextItemX = _getNearestItemIndex(centerItemX) * itemSize;
      final shiftToNextItemX = centerItemX - nextItemX;
      return nextItemX + shiftToNextItemX * (1.0 - animation);
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
    final allSimulationsDuration = _getClampingScrollSimulationDuration() + _magneticSimulationDuration;
    return time >= allSimulationsDuration;
  }

  @override
  set tolerance(Tolerance _tolerance) {
    _scrollSimulation.tolerance = _tolerance;
  }

  @override
  Tolerance get tolerance => _scrollSimulation.tolerance;


  // ===============================
  static const double _inflexion = 0.35;

  static double _decelerationForFriction(double friction) {
    return 9.80665 *
        39.37 *
        friction *
        1.0 * // Flutter operates on logical pixels so the DPI should be 1.0.
        160.0;
  }

  double _splineDeceleration(double velocity) {
    final friction = _scrollSimulation.friction;
    return log(_inflexion * velocity.abs() / (friction * _decelerationForFriction(0.84)));
  }

  static final double _kDecelerationRate = log(0.78) / log(0.9);

  int _splineFlingDuration(double velocity) {
    final double deceleration = _splineDeceleration(velocity);
    return (1000 * exp(deceleration / (_kDecelerationRate - 1.0))).round();
  }

  double _getClampingScrollSimulationDuration() {
    final velocity = _scrollSimulation.velocity;
    return _splineFlingDuration(velocity) / 1000;
  }
}