import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/mood_sssessments_provider.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:provider/provider.dart';
import 'calendar_day_button.dart';
import 'package:mind_tracker/src/business_logic/services/date_time_and_string_extensions.dart';


class CalendarDayButtons extends StatefulWidget {
  final int month;
  final int year;

  CalendarDayButtons({@required this.year, @required this.month});

  @override
  _CalendarDayButtonsState createState() => _CalendarDayButtonsState();
}

class _CalendarDayButtonsState extends State<CalendarDayButtons> {
  var _selectedDate;

  @override
  void initState() {
    super.initState();
    final today = DateTime.now().date;
    _selectedDate = today;
  }

  @override
  Widget build(BuildContext context) {
    final firstDayInMonth = DateTime(widget.year, widget.month, 1);
    final daysNumberInMonth = DateTime(widget.year, widget.month + 1).difference(DateTime(widget.year, widget.month)).inDays;
    final emptyDayCount = firstDayInMonth.weekday - 1;
    final calendarEmptyButtons = List.generate(emptyDayCount, (index) => SizedBox());
    final calendarDayButtons = List.generate(daysNumberInMonth, (index) {
      final calendarDayButtonDate = firstDayInMonth.add(Duration(days: index));
      return CalendarDayButton(
        date: calendarDayButtonDate,
        onTap: () {
          setState(() {
            print('PRESS CALENDAR BUTTON ${calendarDayButtonDate.toStringDate()}'); //TODO: delete this line
            _selectedDate = calendarDayButtonDate;
          });
        },
        isSelected: calendarDayButtonDate == _selectedDate,
      );
    });

    return Container(
      padding: EdgeInsets.only(top: dp(8), left: dp(8), right: dp(8)),
      width: double.infinity,
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 7,
        crossAxisSpacing: dp(8),
        mainAxisSpacing: dp(2),
        children: [...calendarEmptyButtons,  ...calendarDayButtons]
      ),
    );
  }
}