import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';
import 'package:mind_tracker/src/business_logic/models/part_of_day.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/mood_assessments_provider.dart';
import 'package:mind_tracker/src/views/screens/main_screen/chart_page/mood_frequency_cards/'
    'mood_frequency_card.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';


class MoodFrequencyCards extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;

  MoodFrequencyCards({@required this.startDate, @required this.endDate});

  Widget _createMoodFrequencyCard(PartOfDay partOfDay, List<MoodAssessment> moodAssessmentsForPeriod) {
    final moodAssessmentForPartOfDay = moodAssessmentsForPeriod.where(
            (moodAssessment) => moodAssessment.partOfDay == partOfDay).toList();
    if (moodAssessmentForPartOfDay.length == 0) {
      return null;
    }
    final moodAssessmentsGroupedByMood = moodAssessmentForPartOfDay.groupListsBy(
            (moodAssessment) => moodAssessment.mood);

    int maxMood = 1;
    int maxMoodsCount = 0;
    for (int mood = 1; mood <= 7; mood++) {
      final hasMood = moodAssessmentsGroupedByMood.containsKey(mood);
      if (hasMood) {
        final moodsCount = moodAssessmentsGroupedByMood[mood].length;
        if (moodsCount >= maxMoodsCount) {
          maxMood = mood;
          maxMoodsCount = moodsCount;
        }
      }
    }
    final moodAssessmentsWithSameMoodCount = moodAssessmentForPartOfDay.where(
            (moodAssessment) => moodAssessment.mood == maxMood).length;
    final moodAssessmentsAllCount = moodAssessmentForPartOfDay.length;

    return MoodFrequencyCard(
      mood: maxMood,
      partOfDay: partOfDay,
      moodAssessmentsWithSameMoodCount: moodAssessmentsWithSameMoodCount,
      moodAssessmentsAllCount: moodAssessmentsAllCount,
    );
  }

  List<Widget> _getMoodFrequencyCards(List<MoodAssessment> moodAssessmentsForPeriod) {
    final List<Widget> moodFrequencyCards = [];
    final partOfDayCount = PartOfDay.values.length;
    for (int i = 0; i < partOfDayCount; i++) {
      final partOfDay = PartOfDay.values[(i + 1) % partOfDayCount];
      final card = _createMoodFrequencyCard(partOfDay, moodAssessmentsForPeriod);
      print('=== Card: $partOfDay : $card');
      if (card != null) {
        moodFrequencyCards.add(card);
      }
    }
    return moodFrequencyCards;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: dp(16), vertical: dp(8)),
      height: MoodFrequencyCard.height * 2 + dp(8*3),
      child: Consumer<MoodAssessmentsProvider>(
        builder: (context, moodAssessmentProvider, child) {
          final moodAssessmentsForPeriod = moodAssessmentProvider
              .getMoodAssessmentsForPeriod(startDate: startDate, endDate: endDate);
          return GridView.count(
            physics: NeverScrollableScrollPhysics(),
            crossAxisSpacing: dp(8),
            mainAxisSpacing: dp(8),
            crossAxisCount: 2,
            childAspectRatio: MoodFrequencyCard.width / MoodFrequencyCard.height,
            children: _getMoodFrequencyCards(moodAssessmentsForPeriod),
          );
        },
      )
    );
  }
}