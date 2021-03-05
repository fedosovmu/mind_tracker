import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'package:mind_tracker/src/views/utils/content.dart';


class CalendarDayOfWeekLabels extends StatelessWidget {
  final int month;
  final int year;

  CalendarDayOfWeekLabels({@required this.year, @required this.month});

  @override
  Widget build(BuildContext context) {
    final firstDayInMonth = DateTime(year, month, 1);
    print('FIRST DAY: $firstDayInMonth');

    return Container(
      padding: EdgeInsets.symmetric(horizontal: dp(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(DateTime.daysPerWeek, (index) {
          final day = firstDayInMonth.add(Duration(days: index));
          final weekDayWord = Content.weekDayNames[day.weekday];
          return Text(
            weekDayWord,
            style: CustomTextStyles.basic.copyWith(
                color: CustomColors.purpleTextSecondary
            ),
          );
        }),
      ),
    );
  }
}