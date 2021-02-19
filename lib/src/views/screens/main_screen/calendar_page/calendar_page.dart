import 'package:flutter/material.dart';
import 'dart:async';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import '../../../utils/metrics.dart';


class CalendarPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Календарь',
      ),
      body: Calendar()
    );
  }
}

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Container(
      margin: EdgeInsets.only(left: dp(16), right: dp(16), top: dp(8)),
      padding: EdgeInsets.symmetric(horizontal: dp(16)),
      height: dp(300),
      decoration: BoxDecoration(
          color: CustomColors.purpleSuperDark,
          borderRadius: BorderRadius.all(Radius.circular(dp(16)))
      ),
      child: Column(
        children: [
          MonthSwitcher(),
          CalendarDayOfWeekLabels(
            year: now.year,
            month: now.month,
          ),
        ],
      ),
    );
  }
}

class MonthSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: dp(3)),
      height: dp(60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Февраль',
            style: CustomTextStyles.basicH1Medium,
          ),
          SizedBox(
            width: dp(32 + 31 + 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MonthSwitchButton(),
                MonthSwitchButton(isRight: true)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MonthSwitchButton extends StatelessWidget {
  static const _pathToLeftIcon = 'assets/icons/arrow_left.png';
  static const _pathToRightIcon = 'assets/icons/arrow_right.png';
  final isRight;

  MonthSwitchButton({this.isRight = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dp(32),
      height: dp(32),
      child: Image.asset(!isRight ? _pathToLeftIcon : _pathToRightIcon),
    );
  }
}

class CalendarDayOfWeekLabels extends StatelessWidget {
  final int month;
  final int year;

  CalendarDayOfWeekLabels({this.year, this.month});

  @override
  Widget build(BuildContext context) {
    final firstDayInMonth = DateTime(year, month, 1);
    print('FIRST DAY: $firstDayInMonth');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(DateTime.daysPerWeek, (index) {
        final day = firstDayInMonth.add(Duration(days: index));
        final weekDayWord = Content.weekDayNames[day.weekday];
        return Text(
            weekDayWord,
          style: CustomTextStyles.basic.copyWith(
            color: CustomColors.purpleTextSecondary
          ),
        );
      }),
    );
  }
}