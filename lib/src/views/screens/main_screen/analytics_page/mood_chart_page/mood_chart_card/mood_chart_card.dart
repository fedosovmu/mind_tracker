import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/screens/main_screen/analytics_page/mood_chart_page/'
    'mood_chart_card/mood_chart.dart';
import 'package:mind_tracker/src/views/screens/main_screen/analytics_page/mood_chart_page/'
    'mood_chart_card/mood_chart_date_labels.dart';
import 'package:mind_tracker/src/views/screens/main_screen/analytics_page/mood_chart_page/'
    'mood_chart_card/period_toggle_buttons.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class MoodChartCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: dp(16), right: dp(16), top: dp(20)),
      width: dp(327),
      height: dp(352),
      decoration: BoxDecoration(
        color: CustomColors.purpleSuperDark,
        borderRadius: BorderRadius.all(Radius.circular(dp(16))),
      ),
      child: Column(
        children: [
          PeriodToggleButtons(
            onPeriodChange: (int index) {
              print('Period was changed to $index');
            },
          ),
          Container(
            padding: EdgeInsets.only(top: dp(14), left: dp(16)),
            //color: Colors.blue,
            width: double.infinity,
            height: dp(40),
            child: Text(
              'Февраль',
              style: CustomTextStyles.basicH1Medium,
            ),
          ),
          MoodChart(),
          Expanded(
            child: MoodChartDateLabels()
          )
        ],
      ),
    );
  }
}