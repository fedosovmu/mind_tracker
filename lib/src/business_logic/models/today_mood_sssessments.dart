import 'package:flutter/widgets.dart';
import 'package:mind_tracker/src/business_logic/services/database_provider.dart';
import 'mood_assessment.dart';


class TodayMoodAssessments extends ChangeNotifier {
  final List<MoodAssessment> moodAssessments;

  TodayMoodAssessments({List<MoodAssessment> this.moodAssessments});

  void add(MoodAssessment moodAssessment) {
    moodAssessments.add(moodAssessment);
    DatabaseProvider.db.insertMoodAssessment(moodAssessment);
    notifyListeners();
  }

  void removeAll() {
    moodAssessments.clear();
    DatabaseProvider.db.deleteAllMoodAssessments();
    notifyListeners();
  }
}