import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'month_switch_buttons/month_switch_buttons.dart';
import 'widgets/calendar_day_of_week_labels.dart';
import 'calendar_day_buttons/calendar_day_buttons.dart';


class Calendar extends StatefulWidget {
  PageController _pageController;

  Calendar () {
    final now = DateTime.now();
    _pageController = PageController();
  }

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  static const _pageChangeAnimationDuration = Duration(milliseconds: 500);
  static const _pageChangeAnimationCurve = Curves.ease;

  var _selectedYear;
  var _selectedMonth;

  @override
  void initState() {
    final now = DateTime.now();
    _selectedYear = now.year;
    _selectedMonth = now.month;
  }

  DateTime _getDateOfCalendarPage(int pageIndex) {
    final now = DateTime.now();
    return DateTime(now.year, now.month - pageIndex);
  }

  void _onSlideChanged(int page) {
    print('On page slide changed to $page');
    setState(() {
      final newDate = _getDateOfCalendarPage(page);
      _selectedYear = newDate.year;
      _selectedMonth = newDate.month;
    });
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: dp(16)),
            height: dp(60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$_selectedYear ${Content.monthNames[_selectedMonth]}',
                  style: CustomTextStyles.basicH1Medium,
                ),
                MonthSwitchButtons(
                  onLeftArrowPressed: () {
                    print('Left arrow pressed');
                    widget._pageController.nextPage(duration: _pageChangeAnimationDuration, curve: _pageChangeAnimationCurve);
                  },
                  onRightArrowPressed: () {
                    print('on right arrow pressed');
                    widget._pageController.previousPage(duration: _pageChangeAnimationDuration, curve: _pageChangeAnimationCurve);
                  },
                ),
              ],
            ),
          ),
          CalendarDayOfWeekLabels(),
          Expanded(
            child: PageView.builder(
              onPageChanged: _onSlideChanged,
              reverse: true,
              controller: widget._pageController,
              itemBuilder: (BuildContext context, int index) {
                print('Calendar page $index');
                var newMonthDate = _getDateOfCalendarPage(index);
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