import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/screens/main_screen/mood_chart_page/'
    'mood_chart_card/mood_chart.dart';
import 'package:mind_tracker/src/views/screens/main_screen/mood_chart_page/'
    'mood_chart_card/mood_chart_date_labels.dart';
import 'package:mind_tracker/src/views/screens/main_screen/mood_chart_page/mood_chart_card/mood_chart_period_text.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/business_logic/services/date_time_and_string_extensions.dart';


class MoodChartCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now().date;
    return Container(
      margin: EdgeInsets.only(left: dp(16), right: dp(16), top: dp(10), bottom: dp(250)),
      padding: EdgeInsets.only(top: dp(5), bottom: dp(13)),
      decoration: BoxDecoration(
        color: CustomColors.purpleSuperDark,
        borderRadius: BorderRadius.all(Radius.circular(dp(16))),
      ),
      child: Column(
        children: [
          MoodChartPeriodText(
            startDate: today.subtract(Duration(days: 7)),
            endDate: today,
          ),
          Expanded(
            child: MoodChart()
          ),
          MoodChartDateLabels()
        ],
      ),
    );
  }
}