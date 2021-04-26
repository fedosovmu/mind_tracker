import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/content.dart';


class ChartDateLabels extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;

  ChartDateLabels({@required this.startDate, @required this.endDate});

  List<Widget> _getDateLabels() {
    final List<Widget> dateLabels = [];
    const labelsCount = 7;
    final daysCount = endDate.difference(startDate).inDays;
    final step = (daysCount + 1) ~/ 7;
    dateLabels.add(Spacer(flex: 4));
    for (int i = 0; i < labelsCount; i++) {
      final date = endDate.subtract(Duration(days: (labelsCount - 1 - i) * step));
      final dateLabel = ChartDateLabel(date: date);
      dateLabels.add(dateLabel);
      if (i < labelsCount - 1) {
        final space = Spacer(flex: 5);
        dateLabels.add(space);
      }
    }
    return dateLabels;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: dp(16)),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: _getDateLabels()
      ),
    );
  }
}


class ChartDateLabel extends StatelessWidget {
  final DateTime date;

  ChartDateLabel({@required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${date.day}',
          style: CustomTextStyles.basic.copyWith(
              color: CustomColors.purpleLight
          ),
        ),
        Text(
          '${Content.weekDayNames[date.weekday]}',
          style: CustomTextStyles.caption.copyWith(
              color: CustomColors.purpleMedium
          ),
        )
      ],
    );
  }

}