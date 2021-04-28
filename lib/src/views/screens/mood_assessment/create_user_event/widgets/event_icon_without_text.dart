

import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';


class EventIconWithoutText extends StatelessWidget {
  final String iconName;
  final bool isSelected;
  final Function onPressed;

  EventIconWithoutText({@required this.iconName, @required this.isSelected, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: isSelected ? CustomColors.main : CustomColors.purpleSuperDark,
            shape: BoxShape.circle
        ),
        child: Center(
          child: Image.asset(
            CustomIconPaths.eventIcons[iconName],
            width: dp(24),
            height: dp(24),
          ),
        ),
      ),
    );
  }
}