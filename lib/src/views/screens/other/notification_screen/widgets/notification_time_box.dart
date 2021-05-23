import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/screens/other/notification_screen/widgets/cross_in_red_circle.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_border_radius.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';


class NotificationTimeBox extends StatelessWidget {
  final bool selected;

  NotificationTimeBox({this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dp(86+8),
      width: dp(70+8),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: dp(86),
              width: dp(70),
              decoration: BoxDecoration(
                color: selected ? CustomColors.main : CustomColors.purpleSuperDark,
                border: Border.all(
                    color: selected ? CustomColors.main : CustomColors.purpleMegaDark,
                    width: dp(1)
                ),
                borderRadius: CustomBorderRadius(dp(16)),
              ),
            ),
          ),
          Align(
              alignment: Alignment.topRight,
              child: CrossInRedCircle()
          )
        ],
      ),
    );
  }
}