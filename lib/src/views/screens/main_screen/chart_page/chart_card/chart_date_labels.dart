import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/content.dart';


class ChartDateLabels extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;

  ChartDateLabels({@required this.startDate, @required this.endDate});

  List<DateTime> _getDates() {
    final int period = endDate.difference(startDate).inDays;
    print('=== $startDate $endDate $period');
    if ((period + 1) % 7 == 0) {
      const int stepsCount = 6;
      final int step = (period + 1) ~/ stepsCount;
      return List.generate(stepsCount + 1, (i) => startDate.add(Duration(days: step * (i))));
    }
    return [
      startDate,
      endDate
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: dp(16)),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _getDates().map((date) {
            return ChartDateLabel(date: date);
          }).toList()
          //List.generate(DateTime.daysPerWeek, (index) {
          //  final day = DateTime.now().subtract(Duration(days: DateTime.daysPerWeek - (index + 1)));
          //  return ChartDateLabel(day: day.day, weekday: day.weekday);
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
          style: CustomTextStyles.basic.copyWith(
              color: CustomColors.purpleMedium
          ),
        )
      ],
    );
  }

}