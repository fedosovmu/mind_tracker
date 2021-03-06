import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/mood_sssessments_provider.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:provider/provider.dart';
import 'calendar_day_button.dart';


class CalendarDayButtons extends StatelessWidget {
  final int month;
  final int year;

  CalendarDayButtons({@required this.year, @required this.month});

  @override
  Widget build(BuildContext context) {
    final firstDayInMonth = DateTime(year, month, 1);
    final daysNumberInMonth = DateTime(year, month + 1).difference(DateTime(year, month)).inDays;
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: dp(8), left: dp(8), right: dp(8)),
        width: double.infinity,
        child: GridView.count(
          crossAxisCount: 7,
          crossAxisSpacing: dp(8),
          mainAxisSpacing: dp(2),
          children: List.generate(daysNumberInMonth, (index) {
            return CalendarDayButton(
              date: firstDayInMonth.add(Duration(days: index)),
            );
          }),
        ),
      ),
    );
  }
}