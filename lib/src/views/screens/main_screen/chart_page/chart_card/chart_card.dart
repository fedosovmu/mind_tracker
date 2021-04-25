import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/screens/main_screen/chart_page/chart_card/chart.dart';
import 'package:mind_tracker/src/views/screens/main_screen/chart_page/chart_card/chart_date_labels.dart';
import 'package:mind_tracker/src/views/screens/main_screen/chart_page/chart_card/chart_period_text.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_border_radius.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';


class ChartCard extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;

  ChartCard({@required this.startDate, @required this.endDate});

  @override
  Widget build(BuildContext context) {
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
            startDate: startDate,
            endDate: endDate,
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