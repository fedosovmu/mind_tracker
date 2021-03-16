import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'month_switch_buttons/month_switch_buttons.dart';
import 'widgets/calendar_day_of_week_labels.dart';
import 'calendar_day_buttons/calendar_day_buttons.dart';


class Calendar extends StatelessWidget {
  PageController _pageController;

  static const _pageChangeAnimationDuration = Duration(milliseconds: 500);
  static const _pageChangeAnimationCurve = Curves.ease;

  Calendar () {
    final now = DateTime.now();
    _pageController = PageController();
  }

  Widget _buildCalendarPage(int pageIndex) {
    final now = DateTime.now();
    var newMonthDate = DateTime(now.year, now.month - pageIndex);
    return CalendarDayButtons(
      year: newMonthDate.year,
      month: newMonthDate.month,
    );
  }

  void _onSlideChanged(int page) {
    print('On page slide changed to $page');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: dp(16), right: dp(16), top: dp(8)),
      height: dp(321),
      decoration: BoxDecoration(
          color: CustomColors.purpleSuperDark,
          borderRadius: BorderRadius.all(Radius.circular(dp(16)))
      ),
      child: Column(
        children: [
          MonthSwitchButtons(
            onLeftArrowPressed: () {
              print('Left arrow pressed');
              _pageController.nextPage(duration: _pageChangeAnimationDuration, curve: _pageChangeAnimationCurve);
            },
            onRightArrowPressed: () {
              print('on right arrow pressed');
              _pageController.previousPage(duration: _pageChangeAnimationDuration, curve: _pageChangeAnimationCurve);
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
                return _buildCalendarPage(index);
              }
            )
          ),
        ],
      ),
    );
  }
}