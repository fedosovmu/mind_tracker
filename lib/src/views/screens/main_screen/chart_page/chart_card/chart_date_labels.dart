import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/content.dart';


class ChartDateLabels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: dp(16)),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(DateTime.daysPerWeek, (index) {
            final day = DateTime.now().subtract(Duration(days: DateTime.daysPerWeek - (index + 1)));
            return ChartDateLable(day: day.day, weekday: day.weekday);
          })
      ),
    );
  }
}


class ChartDateLable extends StatelessWidget {
  final int day;
  final int weekday;

  ChartDateLable({@required this.day, @required this.weekday});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${day}',
          style: CustomTextStyles.basic.copyWith(
              color: CustomColors.purpleLight
          ),
        ),
        Text(
          '${Content.weekDayNames[weekday]}',
          style: CustomTextStyles.basic.copyWith(
              color: CustomColors.purpleMedium
          ),
        )
      ],
    );
  }

}