import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/glow_disabler.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_border_shape.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class CustomTimePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: dp(200),
      width: double.infinity,
      decoration: ShapeDecoration(
        color: CustomColors.purpleSuperDark,
        shape: CustomBorderShape(dp(16)),
      ),
      child: Center(
        child: TimePickerDrum(),
      )
    );
  }
}


class TimePickerDrum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: dp(100),
      //color: Colors.yellow,
      child: GlowDisabler(
        child: ListView(
          physics: ItemScrollPhysics(
            itemHeight: dp(68),
            targetPixelsLimit: dp(68)
          ),
          children: [
            TimePickerDrumElement('00'),
            TimePickerDrumElement('01'),
            TimePickerDrumElement('02'),
            TimePickerDrumElement('03'),
            TimePickerDrumElement('04'),
            TimePickerDrumElement('05'),
            TimePickerDrumElement('06'),
            TimePickerDrumElement('07'),
            TimePickerDrumElement('08'),
            TimePickerDrumElement('09'),
            TimePickerDrumElement('10'),
            TimePickerDrumElement('11'),
            TimePickerDrumElement('12'),
            TimePickerDrumElement('13'),
            TimePickerDrumElement('14'),
            TimePickerDrumElement('15'),
            TimePickerDrumElement('16'),
            TimePickerDrumElement('17'),
            TimePickerDrumElement('18'),
            TimePickerDrumElement('19'),
            TimePickerDrumElement('20'),
            TimePickerDrumElement('21'),
            TimePickerDrumElement('22'),
            TimePickerDrumElement('23'),
          ],
        ),
      ),
    );
  }
}


class TimePickerDrumElement extends StatelessWidget {
  final String text;

  TimePickerDrumElement(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: dp(60),
      margin: EdgeInsets.only(bottom: dp(8)),
      child: Center(
        child: Text(
          text,
          style: CustomTextStyles.titleH1.copyWith(
            fontSize: dp(44),
          ),
        )
      ),
    );
  }
}


class ItemScrollPhysics extends ScrollPhysics {
  /// Creates physics for snapping to item.
  /// Based on PageScrollPhysics
  final double itemHeight;
  final double targetPixelsLimit;

  const ItemScrollPhysics({
    ScrollPhysics parent,
    this.itemHeight,
    this.targetPixelsLimit = 3.0,
  }) : assert(itemHeight != null && itemHeight > 0),
        super(parent: parent);

  @override
  ItemScrollPhysics applyTo(ScrollPhysics ancestor) {
    return ItemScrollPhysics(parent: buildParent(ancestor), itemHeight: itemHeight);
  }

  double _getItem(ScrollPosition position) {
    double maxScrollItem = (position.maxScrollExtent / itemHeight).floorToDouble();
    return min(max(0, position.pixels / itemHeight), maxScrollItem);
  }

  double _getPixels(ScrollPosition position, double item) {
    return item * itemHeight;
  }

  double _getTargetPixels(ScrollPosition position, Tolerance tolerance, double velocity) {
    double item = _getItem(position);
    if (velocity < -tolerance.velocity)
      item -= targetPixelsLimit;
    else if (velocity > tolerance.velocity)
      item += targetPixelsLimit;
    return _getPixels(position, item.roundToDouble());
  }

  @override
  Simulation createBallisticSimulation(ScrollMetrics position, double velocity) {
    // If we're out of range and not headed back in range, defer to the parent
    // ballistics, which should put us back in range at a item boundary.
//    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
//        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent))
//      return super.createBallisticSimulation(position, velocity);
    Tolerance tolerance = this.tolerance;
    final double target = _getTargetPixels(position, tolerance, velocity);
    if (target != position.pixels)
      return ScrollSpringSimulation(spring, position.pixels, target, velocity, tolerance: tolerance);
    return null;
  }

  @override
  bool get allowImplicitScrolling => false;
}