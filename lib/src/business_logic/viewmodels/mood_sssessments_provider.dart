import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:mind_tracker/src/business_logic/services/firebase_provider.dart';
import '../models/mood_assessment.dart';


class MoodAssessmentsProvider extends ChangeNotifier {
  List<MoodAssessment> moodAssessments;

  MoodAssessmentsProvider({List<MoodAssessment> this.moodAssessments,});

  List<MoodAssessment> get todayMoodAssessments {
    final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    return moodAssessments.where((moodAssessment) => moodAssessment.date == today).toList();
  }

  List<double> getAverageDailyMoodForWeek () {
    final now = DateTime.now();
    final weekDates = List.generate(7, (index) {
      final weekDateTime = now.subtract(Duration(days: 6 - index));
      return DateFormat('yyyy-MM-dd').format(weekDateTime);
    });
    final moodAssessmentsGroupedByDates = groupBy(moodAssessments,
            (moodAssessment) => moodAssessment.date);

    final List<double> averageDailyMoodForWeek = [];
    for (var weekDate in weekDates) {
      if (moodAssessmentsGroupedByDates.containsKey(weekDate)) {
        final moodAssessmentsForWeekDate = moodAssessmentsGroupedByDates[weekDate];
        var sumOfMood = 0;
        moodAssessmentsForWeekDate.forEach((element) {
          sumOfMood += element.mood;
        });
        final averageDailyMood = sumOfMood / moodAssessmentsForWeekDate.length;
        averageDailyMoodForWeek.add(averageDailyMood);
      } else {
        averageDailyMoodForWeek.add(null);
      }
    }
    return averageDailyMoodForWeek;
  }

  void add(MoodAssessment moodAssessment) {
    moodAssessments.add(moodAssessment);
    FirebaseProvider.addMoodAssessment(moodAssessment);
    notifyListeners();
  }
}