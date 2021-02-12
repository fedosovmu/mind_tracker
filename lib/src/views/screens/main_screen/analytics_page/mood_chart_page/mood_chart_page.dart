import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/screens/main_screen/analytics_page/mood_chart_page/mood_chart/mood_chart.dart';


class MoodChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MoodChart(),
          Container(
            margin: EdgeInsets.only(top: dp(11), left: dp(16), right: dp(16)),
            color: Colors.yellow,
            width: double.infinity,
            height: dp(800),
          )
        ],
      ),
    );
  }

}