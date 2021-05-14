import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'month_switch_button.dart';


class MonthSwitchButtons extends StatelessWidget {
  final Function onLeftArrowPressed;
  final Function onRightArrowPressed;
  final bool enableRightArrow;

  MonthSwitchButtons ({@required this.onLeftArrowPressed, @required this.onRightArrowPressed, @required this.enableRightArrow});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: dp(32 + 31 + 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MonthSwitchButton(onPressed: onLeftArrowPressed),
          MonthSwitchButton(onPressed: onRightArrowPressed, isRight: true, enabled: enableRightArrow)
        ],
      ),
    );
  }
}