import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/content.dart';


class MoodChartDateLabels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(DateTime.daysPerWeek, (index) {
          final day = DateTime.now().subtract(Duration(days: DateTime.daysPerWeek - (index + 1)));
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${day.day}',
                style: CustomTextStyles.basic.copyWith(
                    color: CustomColors.purpleLight
                ),
              ),
              Text(
                '${Content.weekDayNames[day.weekday]}',
                style: CustomTextStyles.basic.copyWith(
                    color: CustomColors.purpleMedium
                ),
              )
            ],
          );
        })
    );
  }
}