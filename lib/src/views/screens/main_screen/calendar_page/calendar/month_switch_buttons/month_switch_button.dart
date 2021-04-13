import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';


class MonthSwitchButton extends StatelessWidget {
  final bool isRight;
  final Function onPressed;

  MonthSwitchButton({@required this.onPressed, this.isRight = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: dp(32),
        height: dp(32),
        child: Image.asset(!isRight ? CustomIconPaths.arrowLeft : CustomIconPaths.arrowRight),
      ),
    );
  }
}