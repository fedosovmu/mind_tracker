import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/notification_time.dart';
import 'package:mind_tracker/src/business_logic/models/part_of_day.dart';
import 'package:mind_tracker/src/views/screens/other/notification_screen/widgets/cross_in_red_circle.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_border_shape.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class NotificationTimeBox extends StatelessWidget {
  final bool selected;
  final NotificationTime notificationTime;

  NotificationTimeBox(this.notificationTime, {this.selected = false});

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
              margin: EdgeInsets.only(top: dp(8), right: dp(8)),
              height: double.infinity,
              width: double.infinity,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    CustomIconPaths.partOfDays[
                      PartOfDayBuilder.fromDateTime(notificationTime.toDateTime())
                    ],
                    height: dp(24),
                    width: dp(24),
                  ),
                  SizedBox(height: dp(4)),
                  Text(
                    Content.getTimeString(context, notificationTime.toDateTime()),
                    style: CustomTextStyles.basicH1Medium.copyWith(
                      color: CustomColors.purpleWhite,
                    ),
                  ),
                  SizedBox(height: dp(4)),
                  Text(
                     Content.partOfDayNames[
                       PartOfDayBuilder.fromDateTime(notificationTime.toDateTime())
                     ],
                    style: CustomTextStyles.caption.copyWith(
                      color: CustomColors.purpleWhite
                    ),
                  )
                ],
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