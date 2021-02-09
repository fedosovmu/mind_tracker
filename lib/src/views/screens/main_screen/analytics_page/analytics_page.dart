import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/screens/main_screen/analytics_page/mood_chart/mood_chart.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'package:provider/provider.dart';
import '../../../utils/metrics.dart';


class AnalyticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'График настроения',
      ),
      body: Column(
        children: [
          _buildTabs(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MoodChart(),
                  _buildCards()
                ],
              )
            ),
          )
        ],
      )
    );
  }

  Widget _buildTabs() {
    return Container(
      color: Colors.green,
      width: double.infinity,
      height: dp(40),
      child: Center(
        child: Text(
          'График                                Влияние',
          style: CustomTextStyles.basicH1Medium,
        ),
      ),
    );
  }

  Widget _buildCards() {
    return Container(
      margin: EdgeInsets.only(top: dp(18)),
      color: Colors.yellow,
      width: dp(327),
      height: dp(500),
    );
  }
}