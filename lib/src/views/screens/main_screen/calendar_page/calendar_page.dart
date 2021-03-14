import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/common_widgets/single_child_scroll_view_without_splash.dart';
import 'package:mind_tracker/src/views/common_widgets/mood_assessment_card_list_view/mood_assessment_cards_list_view.dart';
import 'package:mind_tracker/src/business_logic/services/date_time_and_string_extensions.dart';
import 'calendar/calendar.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';


class CalendarPage extends StatelessWidget {
  Widget build(BuildContext context) {
    final today = DateTime.now().date;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Календарь',
      ),
      body: SingleChildScrollViewWithoutSplash(
        child: Column(
          children: [
            Calendar(),
            SizedBox(height: dp(16)),
            MoodAssessmentCardsListView(today),
          ],
        ),
      )
    );
  }
}