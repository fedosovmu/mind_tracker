import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';


class MonthSwitchButton extends StatelessWidget {
  static const _pathToLeftIcon = 'assets/icons/arrow_left.png';
  static const _pathToRightIcon = 'assets/icons/arrow_right.png';
  final isRight;

  MonthSwitchButton({this.isRight = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dp(32),
      height: dp(32),
      child: Image.asset(!isRight ? _pathToLeftIcon : _pathToRightIcon),
    );
  }
}