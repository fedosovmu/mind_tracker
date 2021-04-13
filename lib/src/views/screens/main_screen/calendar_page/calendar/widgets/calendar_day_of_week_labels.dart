import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'package:mind_tracker/src/views/utils/content.dart';


class CalendarDayOfWeekLabels extends StatelessWidget {
  CalendarDayOfWeekLabels();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: dp(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(DateTime.daysPerWeek, (index) {
          final day = index + 1;
          final weekDayWord = Content.weekDayNames[day];
          return Text(
            weekDayWord,
            style: CustomTextStyles.basic.copyWith(
                color: CustomColors.purpleMedium
            ),
          );
        }),
      ),
    );
  }
}