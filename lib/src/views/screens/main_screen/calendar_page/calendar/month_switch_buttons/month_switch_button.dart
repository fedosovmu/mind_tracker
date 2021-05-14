import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';


class MonthSwitchButton extends StatelessWidget {
  final bool isRight;
  final enabled;
  final Function onPressed;

  MonthSwitchButton({@required this.onPressed, this.isRight = false, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onPressed : null,
      child: Container(
        width: dp(32),
        height: dp(32),
        child: Image.asset(
          !isRight ? CustomIconPaths.arrowLeft : CustomIconPaths.arrowRight,
          color: enabled ? CustomColors.white : CustomColors.purpleMedium,
        ),
      ),
    );
  }
}