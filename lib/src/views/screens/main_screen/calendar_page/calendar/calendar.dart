import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'month_switcher.dart';
import 'calendar_day_of_week_labels.dart';


class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Container(
      margin: EdgeInsets.only(left: dp(16), right: dp(16), top: dp(8)),
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
          CalendarDayButtons(
            year: now.year,
            month: now.month,
          )
        ],
      ),
    );
  }
}

class CalendarDayButtons extends StatelessWidget {
  final int month;
  final int year;

  CalendarDayButtons({@required this.year, @required this.month});

  @override
  Widget build(BuildContext context) {
    var daysNumberInMonth = DateTime(year, month + 1).difference(DateTime(year, month)).inDays;
    print('DAYS NUMBER IN MONTH: ${daysNumberInMonth}');
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: dp(8), left: dp(8), right: dp(8)),
        width: double.infinity,
        child: GridView.count(
          crossAxisCount: 7,
          crossAxisSpacing: dp(8),
          mainAxisSpacing: dp(2),
          children: List.generate(daysNumberInMonth, (index) {
            return CalendarDayButton(
              day: index + 1,
              isSelected: (index + 1) == DateTime.now().day,
            );
          }),
        ),
      ),
    );
  }
}

class CalendarDayButton extends StatelessWidget {
  final int day;
  final bool isSelected;

  CalendarDayButton({@required this.day, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$day',
            style: CustomTextStyles.basicH1Medium,
          ),
          CalendarDayButtonMoodSpheres()
        ],
      ),
      decoration: BoxDecoration(
          color: isSelected ? CustomColors.purpleMegaDark : null,
          borderRadius: BorderRadius.all(Radius.circular(dp(8)))
      ),
    );
  }
}

class CalendarDayButtonMoodSpheres extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var moodSpheresCount = 3;
    if (moodSpheresCount == 0) {
      return SizedBox(height: dp(4));
    }

    var moodSpheres = List.generate(moodSpheresCount, (index) {
      return Container(
        width: dp(4),
        height: dp(4),
        decoration: BoxDecoration(
            color: CustomColors.moods[5],
            shape: BoxShape.circle
        ),
      );
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(moodSpheres.length * 2 - 1, (index) {
        if (index % 2 == 0) {
          return moodSpheres[(index / 2).round()];
        } else {
          return SizedBox(width: dp(2));
        }
      })
    );
  }

}