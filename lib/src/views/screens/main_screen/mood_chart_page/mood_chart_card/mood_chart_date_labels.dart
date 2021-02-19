import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/content.dart';


class MoodChartDateLabels extends StatelessWidget with Content {
  @override
  Widget build(BuildContext context) {
    loadContent('moodChartDateLabels');
    return Container(
      padding: EdgeInsets.symmetric(horizontal: dp(14)),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(7, (index) {
            final day = DateTime.now().subtract(Duration(days: 6 - index));
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
                  '${content['weekDayNames'][(day.weekday - 1)]}',
                  style: CustomTextStyles.basic.copyWith(
                      color: CustomColors.purpleTextSecondary
                  ),
                )
              ],
            );
          })
      ),
    );
  }
}