import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';


class InfluenceCardEventIcon extends StatelessWidget {
  final String icon;

  InfluenceCardEventIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dp(40),
      width: dp(40),
      decoration: BoxDecoration(
        color: CustomColors.purpleDark,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Image.asset(
          CustomIconPaths.eventIcons[icon],
          height: dp(24),
          width: dp(24),
        ),
      ),
    );
  }
}