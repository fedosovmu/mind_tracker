import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'month_switcher.dart';
import 'calendar_day_of_week_labels.dart';


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
          CalendarDayButtons()
        ],
      ),
    );
  }
}

class CalendarDayButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.green,
        width: double.infinity,
        child: GridView.count(
          crossAxisCount: 7,
          children: List.generate(31, (index) {
            return Container(
              color: index % 2 == 0 ? Colors.red : Colors.orange,
              width: dp(38),
              height: dp(36),
            );
          }),
        ),
      ),
    );
  }
  
}