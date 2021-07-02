import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_border_shape.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';


class EventInfluenceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: dp(80),
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: dp(16)),
      padding: EdgeInsets.symmetric(horizontal: dp(16)),
      decoration: ShapeDecoration(
        color: CustomColors.purpleSuperDark,
        shape: CustomBorderShape(dp(16)),
      ),
      child: Row(
        children: [
          Container(
            height: dp(40),
            width: dp(40),
            decoration: BoxDecoration(
                color: CustomColors.purpleDark,
                shape: BoxShape.circle
            ),
            child: Center(
              child: Image.asset(
                CustomIconPaths.eventIcons['desktop'],
                height: dp(24),
                width: dp(24),
              ),
            ),
          ),
          Column(
            children: [
              Text('Хороший код'),
              
            ],
          )
        ],
      ),
    );
  }
}