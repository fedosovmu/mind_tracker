import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/screens/other/notification_screen/custom_time_picker/widgets/custom_simulation.dart';


class CustomScrollPhysics extends ScrollPhysics {
  final int itemsCount;
  final double itemSize;

  CustomScrollPhysics({@required this.itemsCount, @required this.itemSize});


  @override
  ScrollPhysics applyTo(ScrollPhysics ancestor) {
    return CustomScrollPhysics(itemsCount: itemsCount, itemSize: itemSize);
  }

  @override
  Simulation createBallisticSimulation(ScrollMetrics position, double velocity) {
    return CustomSimulation(
        initPosition: position.pixels,
        initVelocity: velocity,
        itemsCount: itemsCount,
        itemSize: itemSize
    );
  }
}