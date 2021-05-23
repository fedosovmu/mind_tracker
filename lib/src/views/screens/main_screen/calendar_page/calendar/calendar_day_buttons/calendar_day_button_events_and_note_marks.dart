import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/mood_assessments_provider.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:provider/provider.dart';


class CalendarDayButtonEventsAndNoteMarks extends StatelessWidget {
  final DateTime date;

  CalendarDayButtonEventsAndNoteMarks(this.date);

  @override
  Widget build(BuildContext context) {
    return Consumer<MoodAssessmentsProvider> (
      builder: (context, moodAssessmentProvider, child) {
        final moodAssessmentsForDay = moodAssessmentProvider.getMoodAssessmentsForDate(date);
        final hasEvents = moodAssessmentsForDay.where(
                (moodAssessment) => moodAssessment.events != null).length > 0;
        final hasNotes = moodAssessmentsForDay.where(
                (moodAssessment) => moodAssessment.note != null).length > 0;
        return Container(
          height: dp(4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Mark(hasEvents),
              SizedBox(width: dp(2)),
              _Mark(hasNotes)
            ],
          ),
        );
      },
    );
  }
}


class _Mark extends StatelessWidget {
  final bool enabled;

  _Mark(this.enabled);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dp(2),
      width: dp(8),
      decoration: BoxDecoration(
        color: enabled ? CustomColors.purpleLight : Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(dp(1)))
      ),
    );
  }

}