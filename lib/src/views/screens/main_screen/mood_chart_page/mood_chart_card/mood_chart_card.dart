import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/screens/main_screen/mood_chart_page/'
    'mood_chart_card/mood_chart.dart';
import 'package:mind_tracker/src/views/screens/main_screen/mood_chart_page/'
    'mood_chart_card/mood_chart_date_labels.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class MoodChartCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: dp(16), right: dp(16), top: dp(10), bottom: dp(250)),
      padding: EdgeInsets.only(top: dp(5), bottom: dp(13)),
      decoration: BoxDecoration(
        color: CustomColors.purpleSuperDark,
        borderRadius: BorderRadius.all(Radius.circular(dp(16))),
      ),
      child: Column(
        children: [
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
          Expanded(
            child: MoodChart()
          ),
          MoodChartDateLabels()
        ],
      ),
    );
  }
}