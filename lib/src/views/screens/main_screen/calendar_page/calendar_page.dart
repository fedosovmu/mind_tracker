import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/common_widgets/single_child_scroll_view_without_splash.dart';
import 'package:mind_tracker/src/views/common_widgets/mood_assessment_card_list_view/mood_assessment_cards_list_view.dart';
import 'package:mind_tracker/src/business_logic/services/date_time_and_string_extensions.dart';
import 'calendar/calendar.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';


class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _selectedDate;

  @override
  initState() {
    final today = DateTime.now().date;
    _selectedDate = today;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Календарь',
      ),
      body: LayoutBuilder(
        builder: (context, constrain) {
          final calendarHeight = dp(8) + dp(321) + dp(16);
          return SingleChildScrollViewWithoutSplash(
            child: Container(
              //color: Colors.yellow,
              child: Column(
                children: [
                  Calendar(
                    onSelectedDateChange: (DateTime newDate) {
                      setState(() {
                        _selectedDate = newDate;
                      });
                    },
                  ),
                  SizedBox(height: dp(16)),
                  //MoodAssessmentCardsListView(_selectedDate),
                  ConstrainedBox(
                      constraints: BoxConstraints(minHeight: constrain.maxHeight - calendarHeight),
                      child: MoodAssessmentCardsListView(_selectedDate)
                  ),
                ],
              ),
            ),
          );
        }
      )
    );
  }
}