import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/event.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/mood_assessments_provider.dart';
import 'package:mind_tracker/src/views/common_widgets/other/glow_disabler.dart';
import 'package:mind_tracker/src/views/screens/main_screen/events_page/influence_cards/influence_card.dart';
import 'package:provider/provider.dart';


class InfluenceCards extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;

  InfluenceCards({@required this.startDate, @required this.endDate});

  @override
  Widget build(BuildContext context) {
    return GlowDisabler(
      child: Consumer<MoodAssessmentsProvider>(
        builder: (context, moodAssessmentsProvider, child) {
          final moodAssessmentsForPeriod = moodAssessmentsProvider.getMoodAssessmentsForPeriod(
              startDate: startDate,
              endDate: endDate
          );
          final moodAssessmentWithEvents = moodAssessmentsForPeriod.where(
                  (moodAssessment) => moodAssessment.events != null);
          final List<Event> uniqueEvents = [];
          moodAssessmentWithEvents.forEach((moodAssessment) {
            moodAssessment.events.forEach((event) {
              if (!uniqueEvents.contains(event)) {
                uniqueEvents.add(event);
              }
            });
          });
          return ListView(
            children: uniqueEvents.map((event) {
              return InfluenceCard(event);
            }).toList(),
          );
        },
      ),
    );
  }
}