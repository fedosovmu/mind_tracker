import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/screens/other/notification_screen/widgets/cross_in_red_circle.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_border_shape.dart';
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
              decoration: ShapeDecoration(
                color: selected ? CustomColors.main : CustomColors.purpleSuperDark,
                shape: CustomBorderShape(
                  dp(16),
                  side: BorderSide(
                    width: dp(1),
                    color: selected ? CustomColors.main : CustomColors.purpleMegaDark,
                  )
                ),
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