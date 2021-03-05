import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'month_switcher.dart';
import 'calendar_day_of_week_labels.dart';
import 'calendar_day_buttons/calendar_day_buttons.dart';


class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Container(
      margin: EdgeInsets.only(left: dp(16), right: dp(16), top: dp(8)),
      height: dp(300),
      decoration: BoxDecoration(
          color: CustomColors.purpleSuperDark,
          borderRadius: BorderRadius.all(Radius.circular(dp(16)))
      ),
      child: Column(
        children: [
          MonthSwitcher(),
          CalendarDayOfWeekLabels(
            year: now.year,
            month: now.month,
          ),
          CalendarDayButtons(
            year: now.year,
            month: now.month,
          )
        ],
      ),
    );
  }
}