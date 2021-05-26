import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/screens/other/notification_screen/custom_time_picker/widgets/custom_drum_item.dart';
import 'package:mind_tracker/src/views/screens/other/notification_screen/custom_time_picker/widgets/custom_simulation.dart';


class CustomScrollPhysics extends ScrollPhysics {
  @override
  ScrollPhysics applyTo(ScrollPhysics ancestor) {
    return CustomScrollPhysics();
  }

  @override
  Simulation createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    print('create ballistic simulation');
    return CustomSimulation(
        initPosition: position.pixels,
        initVelocity: velocity,
        itemsCount: 60,
        itemHeight: CustomDrumItem.height
    );
  }
}