import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/screens/main_screen/analytics_page/mood_chart_page/mood_chart/mood_chart.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class MoodChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MoodChart(),
          _buildCards()
        ],
      ),
    );
  }

  Widget _buildCards() {
    return Container(
      margin: EdgeInsets.only(top: dp(18), left: dp(16), right: dp(16)),
      child: Column(
        children: List.generate(7, (index) {
          return Container(
            margin: EdgeInsets.only(bottom: dp(12)),
            padding: EdgeInsets.only(left: dp(50)),
            alignment: Alignment.centerLeft,
            width: double.infinity,
            height: dp(56),
            decoration: BoxDecoration(
              color: CustomColors.purpleSuperDark,
              borderRadius: BorderRadius.all(Radius.circular(dp(16)))
            ),
            child: Text(
              '6 - 13 Февраля',
              style: CustomTextStyles.basic.copyWith(
                color: CustomColors.purpleLight
              ),
            ),
          );
        })
      ),
    );
  }
}