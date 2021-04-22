import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class MoodChartPeriodText extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;

  MoodChartPeriodText({@required this.startDate, @required this.endDate});

  @override
  Widget build(BuildContext context) {
    String periodText;
    if (startDate.month == endDate.month) {
      periodText = '${Content.monthNames[startDate.month]} ${startDate.day} – ${endDate.day}';
    } else {
      periodText = '${startDate.day} ${Content.monthNamesInParentCase[startDate.month]}'
          ' - ${endDate.day} ${Content.monthNamesInParentCase[endDate.month]}';
    }

    return Container(
      padding: EdgeInsets.only(left: dp(16)),
      width: double.infinity,
      child: Text(
        periodText,
        style: CustomTextStyles.basicH1Medium,
      ),
    );
  }
}