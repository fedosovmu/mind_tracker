import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/part_of_day.dart';
import 'package:mind_tracker/src/business_logic/services/date_time_and_string_extensions.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/mood_sssessments_provider.dart';
import 'package:mind_tracker/src/views/common_widgets/mood_assessment_card_list_view/widgets/mood_sphere.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:provider/provider.dart';
import 'widgets/mood_assessment_card.dart';
import 'widgets/mood_assessment_empty_card.dart';


class MoodAssessmentCardsListView extends StatelessWidget {
  final DateTime dateForDisplayedMoodAssessments;
  bool _isToday;
  bool _isFuture;
  PartOfDay _currentPartOfDay;
  static const _partOfDaysInWhichMayBeEmptyCards = {PartOfDay.morning, PartOfDay.day, PartOfDay.evening};

  MoodAssessmentCardsListView(this.dateForDisplayedMoodAssessments) {
    final now = DateTime.now();
    _currentPartOfDay = PartOfDayBuilder.fromDateTime(now);
    final today = now.date;
    _isToday = (dateForDisplayedMoodAssessments == today);
    _isFuture = (dateForDisplayedMoodAssessments.isAfter(today));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MoodAssessmentsProvider>(
        builder: (context, moodAssessmentsProvider, child) {
          final moodAssessmentsForDay = moodAssessmentsProvider.getMoodAssessmentsForDate(dateForDisplayedMoodAssessments);

          List<Widget> moodAssessmentCards = [];
          List<Widget> moodSpheres = [];
          var cardIndex = 0;
          for (var partOfDay in PartOfDay.values) {
            final moodAssessmentsForPartOfDay = moodAssessmentsForDay.where(
                    (moodAssessment) => moodAssessment.partOfDay == partOfDay).toList();
            if (moodAssessmentsForPartOfDay.isNotEmpty) {
              for (var moodAssessment in moodAssessmentsForPartOfDay) {
                final card = MoodAssessmentCard(moodAssessment);
                moodAssessmentCards.add(card);
                final moodSphere = MoodSphere(cardIndex: cardIndex++, mood: moodAssessment.mood);
                moodSpheres.add(moodSphere);
              }
            } else {
              final isMayContainEmptyCard = _partOfDaysInWhichMayBeEmptyCards.contains(partOfDay);
              final isTimeToShow = (!_isFuture && !_isToday) || (_isToday && partOfDay.index <= _currentPartOfDay.index);
              if (isMayContainEmptyCard && isTimeToShow) {
                final emptyCard = MoodAssessmentEmptyCard(dateForDisplayedMoodAssessments, partOfDay);
                moodAssessmentCards.add(emptyCard);
                cardIndex++;
              }
            }
          }
          final emptySpace = SizedBox(height: dp(48+16));
          moodAssessmentCards.add(emptySpace);

          return Stack(
            children: [
              Column(
                children: moodAssessmentCards,
              ),
              ...moodSpheres,
            ]
          );
        }
    );
  }
}