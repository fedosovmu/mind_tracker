import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:mind_tracker/src/business_logic/services/firebase_provider.dart';
import '../models/mood_assessment.dart';
import 'package:mind_tracker/src/business_logic/services/date_time_and_string_extensions.dart';


class MoodAssessmentsProvider extends ChangeNotifier {
  List<MoodAssessment> moodAssessments;

  MoodAssessmentsProvider({List<MoodAssessment> this.moodAssessments,});

  List<MoodAssessment> get todayMoodAssessments {
    final today = DateTime.now().date;
    final todayMoodAssessments = moodAssessments.where((moodAssessment) => moodAssessment.date == today).toList();
    todayMoodAssessments.sort();
    return todayMoodAssessments;
  }

  List<double> getAverageDailyMoodForWeek () {
    final now = DateTime.now();
    final weekDates = List.generate(7, (index) {
      return now.date.subtract(Duration(days: 6 - index));;
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

  List<MoodAssessment> getMoodAssessmentsForDate (DateTime date) {
    final moodAssessmentsForDate = moodAssessments.where(
            (moodAssessment) => moodAssessment.date == date.date).toList();
    moodAssessmentsForDate.sort();
    return moodAssessmentsForDate;
  }

  void add(MoodAssessment moodAssessment) {
    moodAssessments.add(moodAssessment);
    FirebaseProvider.addMoodAssessment(moodAssessment);
    notifyListeners();
  }
}