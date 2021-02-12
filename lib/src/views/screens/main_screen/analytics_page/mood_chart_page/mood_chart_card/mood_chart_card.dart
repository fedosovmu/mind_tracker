import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/screens/main_screen/analytics_page/mood_chart_page/mood_chart_card/period_toggle_buttons.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class MoodChartCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: dp(20)),
      width: dp(327),
      height: dp(352),
      decoration: BoxDecoration(
        color: CustomColors.purpleSuperDark,
        borderRadius: BorderRadius.all(Radius.circular(dp(16))),
      ),
      child: Column(
        children: [
          PeriodToggleButtons(),
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
          _buildMoodChart(),
          Expanded(
            child: Container(
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMoodChart() {
    return Container(
      //margin: EdgeInsets.only(left: dp(0), top: dp(0), right: dp(0)),
      color: Colors.orange,
      //width: double.infinity,
      height: dp(220),
    );
  }
}
