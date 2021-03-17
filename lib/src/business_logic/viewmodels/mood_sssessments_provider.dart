import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:mind_tracker/src/business_logic/services/firebase_provider.dart';
import '../models/mood_assessment.dart';
import 'package:mind_tracker/src/business_logic/services/date_time_and_string_extensions.dart';


class MoodAssessmentsProvider extends ChangeNotifier {
  List<MoodAssessment> moodAssessments;

  MoodAssessmentsProvider({List<MoodAssessment> this.moodAssessments,});

  List<MoodAssessment> getMoodAssessmentsForDate (DateTime date) {
    final List<MoodAssessment> moodAssessmentsForDate = moodAssessments.where(
            (moodAssessment) => moodAssessment.date == date.date).toList();
    moodAssessmentsForDate.sort();
    return moodAssessmentsForDate;
  }

  List<MoodAssessment> getMoodAssessmentForPeriod ({@required DateTime startDate, @required DateTime endDate}) {
    final List<MoodAssessment> weekMoodAssessments = moodAssessments.where((moodAssessment) {
      final DateTime date = moodAssessment.date;
      final bool isAfterOrAtTheSameTime = date.isAfter(startDate) || date == startDate;
      final bool isBeforeOrAtTheSameTime = date.isBefore(endDate) || date == endDate;
      return isAfterOrAtTheSameTime && isBeforeOrAtTheSameTime;
    }).toList();
    weekMoodAssessments.sort();
    return weekMoodAssessments;
  }

  void add(MoodAssessment moodAssessment) {
    moodAssessments.add(moodAssessment);
    FirebaseProvider.addMoodAssessment(moodAssessment);
    notifyListeners();
  }
}