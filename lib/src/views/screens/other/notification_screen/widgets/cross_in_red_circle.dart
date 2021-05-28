import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';


class CrossInRedCircle extends StatelessWidget {
  final Function onPressed;

  CrossInRedCircle({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: dp(24),
        width: dp(24),
        decoration: BoxDecoration(
            color: CustomColors.red,
            shape: BoxShape.circle
        ),
        child: Center(
          child: Image.asset(
            CustomIconPaths.close,
            color: CustomColors.purpleDark,
            height: dp(16),
            width: dp(16),
          ),
        ),
      ),
    );
  }
}