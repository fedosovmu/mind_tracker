import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/content.dart';


class ChartDateLabels extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;

  ChartDateLabels({@required this.startDate, @required this.endDate});

  Widget _getPositionedLabel({@required double normalizedPosition, @required DateTime date}) {
    const int startPosition  = 0;
    const int endPosition = 280;
    const int normalizationFactor = endPosition - startPosition;
    return Positioned(
        bottom: 0,
        left: dp(normalizedPosition * normalizationFactor),
        child: ChartDateLabel(date: date)
    );
  }

  List<Widget> _getDateLabels() {
    final daysCount = endDate.difference(startDate).inDays;
    final labelsCount = daysCount <= 7 ? daysCount + 1 : 8;
    final dateStep = (daysCount + 1) ~/ (labelsCount - 1);
    final chartStep = (1 / daysCount) * dateStep;
    final List<Widget> dateLabels = [];
    for (int i = 0; i < labelsCount; i++) {
      final date = endDate.subtract(Duration(days: i * dateStep));
      final dateLabel = _getPositionedLabel(
        date: date,
        normalizedPosition: 1.0 - i * chartStep
      );
      dateLabels.add(dateLabel);
    }
    return dateLabels;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: dp(16)),
      child: Container(
        width: double.infinity,
        height: dp(30),
        child: Stack(
          children: _getDateLabels()
        ),
      )
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