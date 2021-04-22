import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/screens/main_screen/chart_page/chart_card/chart.dart';
import 'package:mind_tracker/src/views/screens/main_screen/chart_page/chart_card/chart_date_labels.dart';
import 'package:mind_tracker/src/views/screens/main_screen/chart_page/chart_card/chart_period_text.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_border_radius.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/business_logic/services/date_time_and_string_extensions.dart';


class ChartCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now().date;
    return Container(
      margin: EdgeInsets.only(top: dp(16)),
      width: dp(330),
      height: dp(320),
      padding: EdgeInsets.symmetric(vertical: dp(16)),
      decoration: BoxDecoration(
        color: CustomColors.purpleSuperDark,
        borderRadius: CustomBorderRadius(dp(16))
      ),
      child: Column(
        children: [
          ChartPeriodText(
            startDate: today.subtract(Duration(days: 7)),
            endDate: today,
          ),
          Expanded(
            child: Chart()
          ),
          ChartDateLabels()
        ],
      ),
    );
  }
}