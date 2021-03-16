import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'month_switcher.dart';
import 'calendar_day_of_week_labels.dart';
import 'calendar_day_buttons/calendar_day_buttons.dart';


class Calendar extends StatelessWidget {
  PageController _pageController;

  static const _pageChangeAnimationDuration = Duration(milliseconds: 500);
  static const _pageChangeAnimationCurve = Curves.ease;

  Calendar () {
    final now = DateTime.now();
    _pageController = PageController();
  }

  void _onSlideChanged(int page) {
    print('On page slide chaned tp $page');
  }

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
          MonthSwitcher(
            onMonthSwitched: (DateTime selectedMonth) {
              print('Month switched $selectedMonth');
              final now = DateTime.now();
              final datesDifferenceInMonths = (now.year - selectedMonth.year) * 12 + now.month - selectedMonth.month;
              print('dates difference: ${datesDifferenceInMonths}');
              _pageController.animateToPage(
                  datesDifferenceInMonths,
                  duration: _pageChangeAnimationDuration,
                  curve: _pageChangeAnimationCurve
              );
            },
          ),
          CalendarDayOfWeekLabels(),
          Expanded(
            child: PageView.builder(
              onPageChanged: _onSlideChanged,
              reverse: true,
              controller: _pageController,
              itemBuilder: (BuildContext context, int index) {
                print('Calendar page $index');
                var newMonthDate = DateTime(now.year, now.month - index);
                return CalendarDayButtons(
                  year: newMonthDate.year,
                  month: newMonthDate.month,
                );
              }
            )
          ),
        ],
      ),
    );
  }
}