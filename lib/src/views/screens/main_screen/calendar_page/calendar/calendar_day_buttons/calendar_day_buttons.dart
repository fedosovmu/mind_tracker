import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/mood_sssessments_provider.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:provider/provider.dart';
import 'calendar_day_button.dart';
import 'package:mind_tracker/src/business_logic/services/date_time_and_string_extensions.dart';


class CalendarDayButtons extends StatefulWidget {
  final int month;
  final int year;
  final Function onSelectedDateChanged;

  CalendarDayButtons({@required this.year, @required this.month, @required this.onSelectedDateChanged});

  @override
  _CalendarDayButtonsState createState() => _CalendarDayButtonsState();
}

class _CalendarDayButtonsState extends State<CalendarDayButtons> {
  DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    final today = DateTime.now().date;
    _selectedDate = today;
  }

  @override
  Widget build(BuildContext context) {
    final DateTime firstDayInMonth = DateTime(widget.year, widget.month, 1);
    final int daysNumberInMonth = DateTime(widget.year, widget.month + 1).difference(DateTime(widget.year, widget.month)).inDays;
    final int emptyDayCount = firstDayInMonth.weekday - 1;
    final List<Widget> calendarEmptyButtons = List.generate(emptyDayCount, (index) => SizedBox.shrink());
    final List<Widget> calendarDayButtons = List.generate(daysNumberInMonth, (index) {
      final DateTime calendarDayButtonDate = firstDayInMonth.add(Duration(days: index));
      return CalendarDayButton(
        date: calendarDayButtonDate,
        onPressed: () {
          setState(() {
            print('Calendar button presed ${calendarDayButtonDate.toStringDate()}');
            _selectedDate = calendarDayButtonDate;
            widget.onSelectedDateChanged(calendarDayButtonDate);
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